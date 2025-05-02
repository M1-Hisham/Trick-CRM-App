import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/contacts/contact-view/contact-view/data/model/contacts_view_model.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/delete-note/presentation/delete_note_contact.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/edit-note/presentation/edit_note_contact.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../contact-view/logic/cubit/contact_view_cubit.dart';
import '../../../create-note/presentation/screen/create_note_contact.dart';
import 'loading_notes_screen.dart';

class NotesContactDataBlocBuilder extends StatelessWidget {
  final int contactId;
  const NotesContactDataBlocBuilder({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactViewCubit, BaseState<ContactsViewModel>>(
      bloc: getIt<ContactViewCubit>()..getContactView(contactId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return loadingNotesScreen();
          },
          success: (ContactsViewModel data) {
            final contactNotes = data.contactNotes;
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
                        return CreateNoteContact(
                          contactId: contactId,
                          contextNotes: context,
                        );
                      },
                    );
                    if (result == true) {
                      getIt<ContactViewCubit>().getContactView(contactId);
                    }
                  },
                ),
                spacingV(20),
                Text(
                  'Notes',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(10),
                contactNotes?.isEmpty ?? true
                    ? const Center(child: Text("No notes"))
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.contactNotes?.length ?? 0,
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
                                          return EditNoteContact(
                                            contactId: contactId,
                                            noteId:
                                                data.contactNotes?[index].id ??
                                                    0,
                                            contextNotes: context,
                                            note: data.contactNotes?[index]
                                                    .comment ??
                                                '',
                                          );
                                        },
                                      );
                                      if (result == true) {
                                        getIt<ContactViewCubit>()
                                            .getContactView(contactId);
                                      }
                                    },
                                    backgroundColor: const Color(0xFF21B7CA),
                                    foregroundColor: Colors.white,
                                    icon: Icons.edit_outlined,
                                    label: 'Edit',
                                  ),
                                  SlidableAction(
                                    onPressed: (context) => deleteNoteContact(
                                      context,
                                      contactId,
                                      data.contactNotes?[index].id ?? 0,
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
                                    data.contactNotes?[index].comment ?? '-',
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
            () => getIt<ContactViewCubit>()..getContactView(contactId),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
