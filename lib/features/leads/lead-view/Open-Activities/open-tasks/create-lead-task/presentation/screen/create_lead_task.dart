import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/logic/cubit/create_lead_task_cubit.dart';

import '../../../../../../../../core/cubits/user_cubit.dart';
import '../../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../../core/widgets/app_date_picker_field.dart';
import '../../../../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../../../../core/widgets/app_top_bar_dialog.dart';
import '../../../../../../../../core/widgets/app_waiting_feature.dart';
import '../../../../../../../auth/login/data/models/login_response.dart';
import '../../../../../lead-view/data/model/leads_view_model.dart';
import '../../data/model/create_lead_task_request_body.dart';

class CreateLeadTask extends StatelessWidget {
  final int leadId;
  final String leadName;
  final List<Users> users;
  CreateLeadTask({
    super.key,
    required this.leadId,
    required this.leadName,
    required this.users,
  });

  final ScrollController scrollController = ScrollController();

  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: BlocBuilder<UserCubit, UserData?>(
              bloc: getIt.get<UserCubit>(),
              builder: (context, userData) {
                if (userData == null) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    spacingV(70),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //subject
                          AppTextFormField(
                            isRequired: true,
                            hintText: "Enter Subject",
                            labelText: "Subject",
                            onSaved: (value) {
                              _formData['subject'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter subject";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //description
                          AppTextFormField(
                            hintText: "Enter Description",
                            labelText: "Description",
                            onSaved: (value) {
                              _formData['description'] = value;
                            },
                          ),
                          spacingV(20),
                          //Due Date
                          AppDatePickerField(onSaved: (value) {
                            _formData['dueDate'] = value;
                          }),
                          spacingV(20),
                          //Assign To
                          AppSelectionFormField(
                              labelText: "Assign To",
                              isRequired: true,
                              selections: [
                                {
                                  "name": "${userData.name}(You)",
                                  "id": userData.id,
                                },
                                ...users.map(
                                  (e) => {
                                    "name": "${e.name}",
                                    "id": e.id,
                                  },
                                )
                              ],
                              onSaved: (value) {
                                _formData['assignedToId'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please select assign to";
                                }
                                return null;
                              }),
                          spacingV(20),
                          //Priority
                          AppSelectionFormField(
                            labelText: "Priority",
                            isRequired: true,
                            selections: const [
                              'High',
                              'Highest',
                              'Low',
                              'Lowest',
                              'Normal',
                            ],
                            onSaved: (value) {
                              _formData['priority'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select priority";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            initialValue: {
                              "name": leadName,
                              "id": leadId,
                            },
                            isRequired: true,
                            labelText: 'Lead',
                            selections: [
                              {
                                "name": leadName,
                                "id": leadId,
                              },
                            ],
                            onSaved: (value) {
                              _formData['lead'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select lead";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          //Status
                          AppSelectionFormField(
                            labelText: "Status",
                            isRequired: true,
                            selections: const [
                              'Not Started',
                              'Deferred',
                              'In Progress',
                              'Completed',
                              'Wait For Input',
                            ],
                            onSaved: (value) {
                              _formData['status'] = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please select status";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                        ],
                      ),
                    ),
                    ..._submitAndCancel(context),
                    spacingV(20),
                  ],
                );
              },
            ),
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

  List<Widget> _submitAndCancel(context) {
    return [
      Row(
        children: [
          Expanded(
            child: AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: "Create",
              onPressed: () => _submitCreate(context),
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
      ),
    ];
  }

  void _submitCreate(context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      log("_formData: $_formData");
      var createLeadTaskRequestBody = CreateLeadTaskRequestBody(
        subject: _formData['subject'],
        assignedToId: int.parse(_formData['assignedToId']),
        priority: _formData['priority'],
        leadId: _formData['lead'] != null ? int.parse(_formData['lead']) : null,
        status: _formData['status'],
        dueDate: _formData['dueDate'],
        description: _formData['description'],
      );
      appWaitingFeature(context);
      getIt<CreateLeadTaskCubit>()
          .createLeadTask(leadId, createLeadTaskRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
