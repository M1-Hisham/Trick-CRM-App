import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/contacts/contact-view/contact-view/data/model/contacts_view_model.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/notes-view/logic/cubit/notes_contact_view_cubit.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../create-note/presentation/screen/create_note_contact.dart';
import 'loading_notes_screen.dart';

class NotesContactDataBlocBuilder extends StatelessWidget {
  final int contactId;
  const NotesContactDataBlocBuilder({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesContactViewCubit, BaseState<ContactsViewModel>>(
      bloc: getIt<NotesContactViewCubit>()..getNotesView(contactId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return loadingNotesScreen();
          },
          success: (ContactsViewModel data) {
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
                      getIt<NotesContactViewCubit>().getNotesView(contactId);
                    }
                  },
                ),
                spacingV(20),
                Text(
                  'Notes',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(10),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.contactNotes?.length ?? 0,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        AppTextFormField(
                          isclickable: false,
                          hintText: '',
                          labelText: 'Note',
                          controller: TextEditingController(
                            text: data.contactNotes?[index].comment ?? '-',
                          ),
                          style: TextStyle(
                            color: R.colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        spacingV(25),
                      ],
                    );
                  },
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<NotesContactViewCubit>()..getNotesView(contactId),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
