import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/user_cubit.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/widgets/app_date_picker_field.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_selection_form_field.dart';
import '../../../../core/widgets/app_waiting_feature.dart';
import '../../../auth/login/data/models/login_response.dart';
import '../../../leads/create-lead/presentation/widgets/top_bar_dialog.dart';
import '../data/model/create_campaign_request_body.dart';
import '../logic/cubit/create_campaign_cubit.dart';

class CreateCampaignScreen extends StatelessWidget {
  final List<Map<String, dynamic>> campaignOwner;
  CreateCampaignScreen({super.key, required this.campaignOwner});

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
                          AppSelectionFormField(
                            isRequired: true,
                            labelText: "Campaign Owner",
                            selections: [
                              {
                                "name": "${userData.name}(You)",
                                'id': userData.id,
                              },
                              ...campaignOwner,
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please select campaign owner';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _formData['CampaignOwnerId'] = value;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            labelText: "Type",
                            selections: const [
                              "-None-",
                              "Conference",
                              "Webinar",
                              "Trade",
                              "Show",
                              "Public",
                              "Relations",
                              "Partners",
                              "Referral",
                              "Program",
                              "Advertisement",
                              "Banner Ads",
                              "Direct mail",
                              "Email",
                              "Telemarketing",
                              "Others",
                            ],
                            onSaved: (value) {
                              _formData['type'] = value;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            labelText: "Status",
                            selections: const [
                              "-None-",
                              "Planning",
                              "Active",
                              "Inactive",
                              "Complete",
                            ],
                            onSaved: (value) {
                              _formData['status'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            isRequired: true,
                            hintText: 'Enter Campaign Name',
                            labelText: "Campaign Name",
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                _scrollToTop();
                                return 'Please enter campaign name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _formData['CampaignName'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'EGP',
                            labelText: "Expected Revenue",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['ExpectedRevenue'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'EGP',
                            labelText: "Budget Cost",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['BudgetCost'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'EGP',
                            labelText: "Actual Cost",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['ActualCost'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'Enter Expected Response',
                            labelText: "Expected Response",
                            onSaved: (value) {
                              _formData['ExpectedResponse'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'Enter Numbers Sent',
                            labelText: "Numbers Sent",
                            keyboardType: TextInputType.number,
                            onSaved: (value) {
                              _formData['NumbersSent'] = value;
                            },
                          ),
                          spacingV(20),
                          AppDatePickerField(
                            hintText: 'Start Date',
                            validator: false,
                            onSaved: (value) {
                              _formData['StartDate'] = value;
                            },
                          ),
                          spacingV(20),
                          AppDatePickerField(
                            hintText: 'End Date',
                            validator: false,
                            onSaved: (value) {
                              _formData['EndDate'] = value;
                            },
                          ),
                          spacingV(20),
                          AppTextFormField(
                            hintText: 'Enter Description',
                            labelText: "Description",
                            maxLines: 3,
                            onSaved: (value) {
                              _formData['Description'] = value;
                            },
                          ),
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
              "Create New Campaign",
              "Complete all the fields below the form",
            ),
          ),
        ],
      ),
    );
  }

  void _scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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
      var createCampaignRequestBody = CreateCampaignRequestBody(
        campaignOwnerId: int.parse(_formData['CampaignOwnerId']),
        type: _formData['type'],
        status: _formData['status'],
        campaignName: _formData['CampaignName'],
        expectedRevenue: _formData['ExpectedRevenue'] != ''
            ? int.parse(_formData['ExpectedRevenue'])
            : null,
        budgetCost: _formData['BudgetCost'] != ''
            ? int.parse(_formData['BudgetCost'])
            : null,
        actualCost: _formData['ActualCost'] != ''
            ? int.parse(_formData['ActualCost'])
            : null,
        expectedResponse: _formData['ExpectedResponse'],
        numbersSent: _formData['NumbersSent'] != ''
            ? int.parse(_formData['NumbersSent'])
            : null,
        startDate: _formData['StartDate'],
        endDate: _formData['EndDate'],
        description: _formData['Description'],
      );
      final cubit = getIt.get<CreateCampaignCubit>();
      appWaitingFeature(context);
      await cubit.createCampaign(createCampaignRequestBody);
      Navigator.pop(context);
      Navigator.pop(context, true);
      log("Submit Successfully");
    }
  }
}
