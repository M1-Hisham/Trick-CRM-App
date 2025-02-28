import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../data/model/create_lead_note_reqest_body.dart';
import '../../logic/cubit/create_note_cubit.dart';

class CreateNote extends StatelessWidget {
  final int leadId;
  CreateNote({super.key, required this.leadId});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final String? note;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CreateNoteCubit>(),
      //getIt<CreateNoteCubit>(),
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
                appTopBarDialog("Add New Note"),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Notes',
                        style: R.textStyles.font17PrimaryW600,
                      ),
                      spacingV(10),
                      Form(
                        key: _formKey,
                        child: AppTextFormField(
                          hintText: 'Add New Note',
                          labelText: 'Note',
                          onSaved: (value) {
                            note = value;
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
                      _submitAndCancel(),
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

  Widget _submitAndCancel() {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(
              R.icons.add,
            ),
            text: 'Add Note',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Create Note: success');

                getIt<CreateNoteCubit>().createLeadNote(
                  CreateLeadNoteRequestBody(comment: note!),
                  leadId,
                );
                Get.back();

                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Note added successfully',
                    duration: const Duration(seconds: 2),
                  ),
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
