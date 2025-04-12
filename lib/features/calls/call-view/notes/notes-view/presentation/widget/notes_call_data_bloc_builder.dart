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
import '../../../../call-view/data/model/call_view_model.dart';
import '../../../../call-view/logic/cubit/call_view_cubit.dart';
import '../../../create-note/presentation/screen/create_note_call.dart';
import '../../../delete-note/presentation/delete_note_call.dart';
import '../../../edit-note/presentation/edit_note_call.dart';
import 'loading_notes_screen.dart';

class NotesCallDataBlocBuilder extends StatelessWidget {
  final int callId;
  const NotesCallDataBlocBuilder({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallViewCubit, BaseState<CallViewModel>>(
      bloc: getIt<CallViewCubit>()..getCallView(callId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return loadingNotesScreen();
          },
          success: (CallViewModel data) {
            final callNotes = data.callNotes;
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
                        return CreateNoteCall(
                          callId: callId,
                          contextNotes: context,
                        );
                      },
                    );
                    if (result == true) {
                      getIt<CallViewCubit>().getCallView(callId);
                    }
                  },
                ),
                spacingV(20),
                Text(
                  'Notes',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(10),
                callNotes?.isEmpty ?? true
                    ? const Center(child: Text("No notes"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.callNotes?.length ?? 0,
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
                                          return EditNoteCall(
                                            callId: callId,
                                            noteId:
                                                data.callNotes?[index].id ?? 0,
                                            contextNotes: context,
                                            note: data.callNotes?[index]
                                                    .comment ??
                                                '',
                                          );
                                        },
                                      );
                                      if (result == true) {
                                        getIt<CallViewCubit>()
                                            .getCallView(callId);
                                      }
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_outlined,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => deleteNoteCall(
                                      context,
                                      callId,
                                      data.callNotes?[index].id ?? 0,
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
                                    data.callNotes?[index].comment ?? '-',
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
            () => getIt<CallViewCubit>()..getCallView(callId),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
