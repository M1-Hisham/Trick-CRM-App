import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/widgets/app_date_picker_field.dart';
import '../../../../../../../../core/widgets/app_text_form_field.dart';

class CreateLeadTask extends StatelessWidget {
  final int leadId;
  CreateLeadTask({super.key, required this.leadId});
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            children: [
              spacingV(70),
              Text(
                'Create a new task',
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildFormField('Subject', TextInputType.text, true),
                    _buildFormField('Description', TextInputType.text, false),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 22),
                      child: AppDatePickerField(onSaved: (value) {
                        _formData['Due Date'] = value;
                      }),
                    ),
                    _buildFormFieldSelection(
                        'Assigned To', true, ['User 1', 'User 2', 'User 3']),
                    _buildFormFieldSelection(
                        'Priority', true, ['High', 'Medium', 'Low']),
                    _buildFormFieldSelection(
                        'Lead', true, ['Lead 1', 'Lead 2', 'Lead 3']),
                    _buildFormFieldSelection(
                        'Status', true, ['Open', 'In Progress', 'Completed']),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      icon: SvgPicture.asset(R.icons.add),
                      text: 'Create',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          // Handle form submission
                        }
                      },
                    ),
                  ),
                  spacingH(20),
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
              ),
            ],
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: appTopBarDialog('Add a New Task'),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(
      String fieldName, TextInputType? keyboardType, bool requiredField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: AppTextFormField(
        labelText: fieldName,
        hintText: '',
        fillColor: R.colors.white,
        keyboardType: keyboardType,
        onSaved: (value) {
          _formData[fieldName] = value;
        },
        validator: (String? value) {
          if (requiredField && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildFormFieldSelection(
      String fieldName, bool requiredField, List<String> selections) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: AppSelectionFormField(
        labelText: fieldName,
        selections: selections,
        onSaved: (value) {
          _formData[fieldName] = value;
        },
        validator: (String? value) {
          if (requiredField && (value == null || value.isEmpty)) {
            return 'This field is required';
          }
          return null;
        },
      ),
    );
  }
}
