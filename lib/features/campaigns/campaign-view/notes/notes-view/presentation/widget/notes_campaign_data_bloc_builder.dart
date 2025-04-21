import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../campaign-view/data/model/campaign_view_model.dart';
import '../../../../campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../../../create-note/presentation/screen/create_note_campaign.dart';
import '../../../delete-note/presentation/delete_note_campaign.dart';
import '../../../edit-note/presentation/edit_note_campaign.dart';
import 'loading_notes_screen.dart';

class NotesCampaignDataBlocBuilder extends StatelessWidget {
  final int campaignId;
  const NotesCampaignDataBlocBuilder({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignViewCubit, BaseState<CampaignViewModel>>(
      bloc: getIt<CampaignViewCubit>()..getCampaignView(campaignId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return loadingNotesScreen();
          },
          success: (CampaignViewModel data) {
            final campaignNotes = data.campaignNotes;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  icon: SvgPicture.asset(R.icons.add),
                  text: 'Add Note',
                  onPressed: () async {
                    // Show Add Note Dialog
                    final result = await showDialog(
                      useSafeArea: false,
                      context: context,
                      builder: (context) {
                        return CreateNoteCampaign(
                          campaignId: campaignId,
                          contextNotes: context,
                        );
                      },
                    );
                    if (result == true) {
                      getIt<CampaignViewCubit>().getCampaignView(campaignId);
                    }
                  },
                ),
                spacingV(20),
                Text(
                  'Notes',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(10),
                campaignNotes?.isEmpty ?? true
                    ? const Center(child: Text("No notes"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.campaignNotes?.length ?? 0,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: ActionPane(
                                motion: const ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (context) async {
                                      final result = await showDialog(
                                        useSafeArea: false,
                                        context: context,
                                        builder: (context) {
                                          return EditNoteCampaign(
                                            campaignId: campaignId,
                                            noteId:
                                                data.campaignNotes?[index].id ??
                                                    0,
                                            contextNotes: context,
                                            note: data.campaignNotes?[index]
                                                    .comment ??
                                                '',
                                          );
                                        },
                                      );
                                      if (result == true) {
                                        getIt<CampaignViewCubit>()
                                            .getCampaignView(campaignId);
                                      }
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_outlined,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => deleteNoteCampaign(
                                      context,
                                      campaignId,
                                      data.campaignNotes?[index].id ?? 0,
                                    ),
                                    backgroundColor: const Color(0xFFFE4A49),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: AppTextFormField(
                                isclickable: false,
                                hintText: '',
                                labelText: 'Note',
                                initialValue:
                                    data.campaignNotes?[index].comment ?? '-',
                                style: TextStyle(
                                  color: R.colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<CampaignViewCubit>()..getCampaignView(campaignId),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
