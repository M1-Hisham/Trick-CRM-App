import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/show_snack_bar.dart';
import 'package:trick_crm_app/core/models/note/edit_note_request_body.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../logic/cubit/edit_note_contact_cubit.dart';

class EditNoteContact extends StatelessWidget {
  final int contactId;
  final int noteId;
  final BuildContext contextNotes;
  final String note;
  EditNoteContact({
    super.key,
    required this.contactId,
    required this.noteId,
    required this.contextNotes,
    required this.note,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final String? updateNote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EditNoteContactCubit>(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          child: SingleChildScrollView(
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                appTopBarDialog("Update Note"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Note',
                        style: R.textStyles.font17PrimaryW600,
                      ),
                      spacingV(10),
                      Form(
                        key: _formKey,
                        child: AppTextFormField(
                          hintText: 'Update Note',
                          labelText: 'Note',
                          initialValue: note,
                          onSaved: (value) {
                            updateNote = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a note';
                            }
                            return null;
                          },
                          maxLines: 8,
                        ),
                      ),
                      spacingV(20),

                      /// Submit and Cancel Button
                      _submitAndCancel(contextNotes),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _submitAndCancel(contextNotes) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(
              R.icons.add,
            ),
            text: 'Update',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Update Note: success');
                appWaitingFeature(contextNotes);
                await getIt<EditNoteContactCubit>().editContactNote(
                  contactId,
                  noteId,
                  EditNoteRequestBody(comment: updateNote),
                );
                Get.back();
                Navigator.pop(contextNotes, true);
                showSnackBar(
                  contextNotes,
                  "Note Updated Successfully",
                );
              }
            },
          ),
        ),
        spacingH(10),
        Expanded(
          child: AppButton(
            text: "Cancel",
            textStyle: R.textStyles.font14DimGrayW400.copyWith(
              fontWeight: FontWeight.w500,
            ),
            onPressed: Get.back,
            backgroundColor: R.colors.white,
            borderColor: const Color(0xffC8C8C8),
            overlayColor: R.colors.primaryColor,
          ),
        ),
      ],
    );
  }
}
