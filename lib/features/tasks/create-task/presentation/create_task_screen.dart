import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_date_picker_field.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import '../../../../core/cubits/user_cubit.dart';
import '../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../../tasks/data/model/tasks_model.dart';
import '../data/model/create_task_request_body.dart';
import '../logic/cubit/create_task_cubit.dart';

class CreateTaskScreen extends StatefulWidget {
  final TasksModel tasksModel;
  const CreateTaskScreen({
    super.key,
    required this.tasksModel,
  });

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
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
                  controller: scrollController,
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  children: [
                    spacingV(120),
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
                                _scrollToTop();
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
                                ...?widget.tasksModel.users != null
                                    ? widget.tasksModel.users?.map((e) => {
                                          "name": "${e.name}",
                                          "id": e.id,
                                        })
                                    : [],
                              ],
                              onSaved: (value) {
                                _formData['assignedToId'] = value;
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  _scrollToTop();
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
                                _scrollToTop();
                                return "Please select priority";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          _leadAndContactAndClientSelections(),
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
                                _scrollToTop();
                                return "Please select status";
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                        ],
                      ),
                    ),
                    spacingV(20),
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
            child: topBarDialog(
              "Create New Task",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  Widget _leadAndContactAndClientSelections() {
    bool isRequired = _formData['lead'] == null &&
        _formData['contact'] == null &&
        _formData['client'] == null;
    return Column(
      children: [
        //Lead
        InputDecorator(
          decoration: InputDecoration(
            label: isRequired
                ? RichText(
                    text: const TextSpan(
                      text: "Lead",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                : const Text("Lead"),
            labelStyle: R.textStyles.font14DimGrayW400.copyWith(
              color: const Color(0XFF2C2E32),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
            hintStyle: R.textStyles.font15RegentGrayW500,
            filled: true,
            fillColor: R.colors.white,
            alignLabelWithHint: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFE8ECF4),
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 250,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              dropdownColor: R.colors.white,
              value: _formData['lead'],
              isDense: true,
              hint: Text(
                "Select an option",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _formData['lead'] = value;
                  _formData['contact'] = null;
                  _formData['client'] = null;
                });
              },
              validator: isRequired
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        _scrollToTop();
                        return "Please select lead";
                      }
                      return null;
                    }
                  : null,
              onSaved: (value) {
                _formData['lead'] = value;
              },
              items: _formData['contact'] != null || _formData['client'] != null
                  ? []
                  : widget.tasksModel.leads
                      ?.map((e) => {
                            "name": "${e.leadName}",
                            "id": e.id,
                          })
                      .map((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value['id'].toString(),
                        child: Text(
                          value['name'],
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      );
                    }).toList(),
            ),
          ),
        ),
        spacingV(20),
        //Contact
        InputDecorator(
          decoration: InputDecoration(
            label: isRequired
                ? RichText(
                    text: const TextSpan(
                      text: "Contact",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                : const Text("Contact"),
            labelStyle: R.textStyles.font14DimGrayW400.copyWith(
              color: const Color(0XFF2C2E32),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
            hintStyle: R.textStyles.font15RegentGrayW500,
            filled: true,
            fillColor: R.colors.white,
            alignLabelWithHint: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFE8ECF4),
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 250,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              dropdownColor: R.colors.white,
              value: _formData['contact'],
              isDense: true,
              hint: Text(
                "Select an option",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _formData['lead'] = null;
                  _formData['contact'] = value;
                  _formData['client'] = null;
                });
              },
              validator: isRequired
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        _scrollToTop();
                        return "Please select contact";
                      }
                      return null;
                    }
                  : null,
              onSaved: (value) {
                _formData['contact'] = value;
              },
              items: _formData['lead'] != null || _formData['client'] != null
                  ? []
                  : widget.tasksModel.contacts
                      ?.map((e) => {
                            "name": "${e.contactName}",
                            "id": e.id,
                          })
                      .map((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value['id'].toString(),
                        child: Text(
                          value['name'],
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      );
                    }).toList(),
            ),
          ),
        ),
        spacingV(20),
        //Client
        InputDecorator(
          decoration: InputDecoration(
            label: isRequired
                ? RichText(
                    text: const TextSpan(
                      text: "Client",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: ' *',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  )
                : const Text("Client"),
            labelStyle: R.textStyles.font14DimGrayW400.copyWith(
              color: const Color(0XFF2C2E32),
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
            isDense: true,
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.h),
            hintStyle: R.textStyles.font15RegentGrayW500,
            filled: true,
            fillColor: R.colors.white,
            alignLabelWithHint: true,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 139, 139, 139),
              ),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              borderSide: BorderSide(
                color: Color(0xFFE8ECF4),
              ),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 250,
              decoration: const InputDecoration(
                border: InputBorder.none,
                isDense: true,
              ),
              dropdownColor: R.colors.white,
              value: _formData['client'],
              isDense: true,
              hint: Text(
                "Select an option",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  _formData['lead'] = null;
                  _formData['contact'] = null;
                  _formData['client'] = value;
                });
              },
              validator: isRequired
                  ? (value) {
                      if (value == null || value.isEmpty) {
                        _scrollToTop();
                        return "Please select client";
                      }
                      return null;
                    }
                  : null,
              onSaved: (value) {
                _formData['client'] = value;
              },
              items: _formData['lead'] != null || _formData['contact'] != null
                  ? []
                  : widget.tasksModel.leads
                      ?.map((e) => {
                            "name": "${e.leadName}",
                            "id": e.id,
                          })
                      .map((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value['id'].toString(),
                        child: Text(
                          value['name'],
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                      );
                    }).toList(),
            ),
          ),
        ),
        spacingV(20),
      ],
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeIn);
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
      var createTaskRequestBody = CreateTaskRequestBody(
        subject: _formData['subject'],
        assignedToId: int.parse(_formData['assignedToId']),
        priority: _formData['priority'],
        contactId: _formData['contact'] != null
            ? int.parse(_formData['contact'])
            : null,
        leadId: _formData['lead'] != null ? int.parse(_formData['lead']) : null,
        clientId:
            _formData['client'] != null ? int.parse(_formData['client']) : null,
        status: _formData['status'],
        dueDate: _formData['dueDate'],
        description: _formData['description'],
      );
      final cubit = getIt.get<CreateTaskCubit>();
      appWaitingFeature(context);
      await cubit.createTask(createTaskRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
