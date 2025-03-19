import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';
import 'package:trick_crm_app/features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_request_body.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../core/di/dependency_injection.dart';
import '../logic/cubit/create_payment_plans_cubit.dart';

class CreatePaymentPlansScreen extends StatelessWidget {
  CreatePaymentPlansScreen({super.key});

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
              appTopBarDialog("Create Payment Plan"),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new Payment Plan',
                      style: R.textStyles.font17PrimaryW600,
                    ),
                    spacingV(10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppTextFormField(
                            hintText: 'DownPayment Percent (%)',
                            labelText: 'DownPayment Percent (%)',
                            onSaved: (value) {
                              _formData["down_payment_percentage"] = value;
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
                            hintText: 'Years',
                            labelText: 'Years',
                            onSaved: (value) {
                              _formData["years"] = value;
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
                            hintText: 'Discount Percent (%)',
                            labelText: 'Discount Percent (%)',
                            onSaved: (value) {
                              _formData["discount"] = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a value';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                          ),
                        ],
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
            text: 'Create',
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                log('Create Payment Plan: Created Successfully');
                var createPaymentPlanRequestBody =
                    CreatePaymentPlansRequestBody(
                  downPaymentPercentage:
                      int.parse(_formData['down_payment_percentage']),
                  years: int.parse(_formData['years']),
                  discount: int.parse(_formData['discount']),
                );
                final cubit = getIt.get<CreatePaymentPlansCubit>();
                await cubit.createPaymentPlan(
                  createPaymentPlanRequestBody,
                );
                Get.back();

                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Payment Plan Created Successfully',
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
