import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/app_waiting_feature.dart';
import '../../data/model/projects_model.dart';
import '../data/model/create_project_request_body.dart';
import '../logic/cubit/create_project_cubit.dart';

class CreateProjectScreen extends StatefulWidget {
  final List<PaymentPlans> paymentPlans;
  const CreateProjectScreen({super.key, required this.paymentPlans});

  @override
  State<CreateProjectScreen> createState() => _CreateProjectScreenState();
}

class _CreateProjectScreenState extends State<CreateProjectScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              appTopBarDialog("Create Project"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new project',
                      style: R.textStyles.font17PrimaryW600,
                    ),
                    spacingV(10),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFormField(
                            isRequired: true,
                            hintText: 'Name',
                            labelText: 'Name',
                            onSaved: (value) {
                              _formData["name"] = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            hintText: 'Size',
                            labelText: 'Size',
                            onSaved: (value) {
                              _formData["size"] = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            hintText: 'Location',
                            labelText: 'Location',
                            onSaved: (value) {
                              _formData["location"] = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'Description',
                            labelText: 'Description',
                            onSaved: (value) {
                              _formData["description"] = value;
                            },
                            maxLines: 2,
                          ),
                          spacingV(20),
                          const Text("Payment Plans:"),
                          spacingV(10),
                          Column(
                            children: widget.paymentPlans.map((paymentPlan) {
                              final isSelected = _formData['payment_plan_ids']
                                      ?.contains(paymentPlan.id) ??
                                  false;

                              return _paymentPlanRow(
                                paymentPlan: paymentPlan,
                                isSelected: isSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    if (value == true) {
                                      _formData['payment_plan_ids'] ??= [];
                                      _formData['payment_plan_ids']
                                          .add(paymentPlan.id);
                                    } else {
                                      _formData['payment_plan_ids']
                                          ?.remove(paymentPlan.id);
                                    }
                                  });
                                },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                    spacingV(20),

                    /// Submit and Cancel Button
                    _submitAndCancel(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitAndCancel(context) {
    return Row(
      children: [
        Expanded(
          child: AppButton(
            icon: SvgPicture.asset(
              R.icons.add,
            ),
            text: 'Create',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Create Project: Susseccful');

                var createProjectRequestBody = CreateProjectRequestBody(
                  name: _formData['name'],
                  size: int.parse(_formData['size']),
                  location: _formData['location'],
                  description: _formData['description'],
                  paymentplans: _formData['payment_plan_ids'] == null
                      ? []
                      : _formData['payment_plan_ids'].cast<int>(),
                );
                final cubit = getIt.get<CreateProjectCubit>();
                appWaitingFeature(context);
                await cubit.createProject(createProjectRequestBody);
                Navigator.pop(context);
                Navigator.pop(context, true);
                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Project Created Successfully',
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

  Widget _paymentPlanRow({
    required final PaymentPlans paymentPlan,
    required final bool isSelected,
    required final ValueChanged<bool?> onChanged,
  }) {
    return Row(
      children: [
        Checkbox(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          activeColor: R.colors.primaryColor,
          side: const BorderSide(
            color: Color(0xffC8C8C8),
            width: 1,
          ),
          value: isSelected,
          onChanged: onChanged,
        ),
        Expanded(
          child: Text(
            paymentPlan.planName ?? 'Unnamed Plan',
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}
