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
import '../../../../deal-view/data/model/deal_view_model.dart';
import '../../../../deal-view/logic/cubit/deal_view_cubit.dart';
import '../../../create-note/presentation/screen/create_note_deal.dart';
import '../../../delete-note/presentation/delete_note_deal.dart';
import '../../../edit-note/presentation/edit_note_deal.dart';
import 'loading_notes_screen.dart';

class NotesDealDataBlocBuilder extends StatelessWidget {
  final int dealId;
  const NotesDealDataBlocBuilder({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealViewCubit, BaseState<DealViewModel>>(
      bloc: getIt<DealViewCubit>()..getDealView(dealId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return loadingNotesScreen();
          },
          success: (DealViewModel data) {
            final dealNotes = data.dealNotes;
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
                        return CreateNoteDeal(
                          dealId: dealId,
                          contextNotes: context,
                        );
                      },
                    );
                    if (result == true) {
                      getIt<DealViewCubit>().getDealView(dealId);
                    }
                  },
                ),
                spacingV(20),
                Text(
                  'Notes',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(10),
                dealNotes?.isEmpty ?? true
                    ? const Center(child: Text("No notes"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.dealNotes?.length ?? 0,
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
                                          return EditNoteDeal(
                                            dealId: dealId,
                                            noteId:
                                                data.dealNotes?[index].id ?? 0,
                                            contextNotes: context,
                                            note: data.dealNotes?[index]
                                                    .comment ??
                                                '',
                                          );
                                        },
                                      );
                                      if (result == true) {
                                        getIt<DealViewCubit>()
                                            .getDealView(dealId);
                                      }
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_outlined,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => deleteNoteDeal(
                                      context,
                                      dealId,
                                      data.dealNotes?[index].id ?? 0,
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
                                    data.dealNotes?[index].comment ?? '-',
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
            () => getIt<DealViewCubit>()..getDealView(dealId),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
