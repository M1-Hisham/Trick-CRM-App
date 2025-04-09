import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_top_bar_dialog.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/resources/resources.dart';
import '../../campaigns-view/data/model/campaigns_model.dart';
import '../data/model/campaign_leads_request_body.dart';
import '../logic/cubit/create_campaign_lead_cubit.dart';

class AddCampaign extends StatelessWidget {
  final List<CampaignsModel> campaignsModel;
  final int leadId;
  AddCampaign({super.key, required this.campaignsModel, required this.leadId});
  final Map<String, dynamic> _formData = {};
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        appTopBarDialog('Add New Campaign'),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Create a new lead campaign',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                AppSelectionFormField(
                  labelText: 'Campaign Name',
                  selections: campaignsModel
                      .map((e) => {
                            'name': e.campaignName ?? '_',
                            'id': e.id,
                          })
                      .toList(),
                  onSaved: (value) {
                    _formData['campaignId'] = value;
                  },
                ),
                spacingV(20),
                AppSelectionFormField(
                  labelText: 'Status',
                  selections: const [
                    'Planned',
                    'Invited',
                    'Sent',
                    'Opened',
                    'Responded',
                    'Bounced',
                    'Opted Out',
                  ],
                  onSaved: (value) {
                    _formData['status'] = value;
                  },
                ),
                spacingV(20),
                Row(
                  children: [
                    Expanded(
                      child: AppButton(
                        text: 'Done',
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState?.save();
                            var createCampaignRequestBody =
                                CampaignLeadsRequestBody(
                              campaignId: int.parse(_formData['campaignId']),
                              status: _formData['status'],
                            );
                            final cubit = getIt.get<CreateCampaignLeadCubit>();
                            await cubit.createLeadCampaign(
                              createCampaignRequestBody,
                              leadId,
                            );
                            log("Submit Successfully");
                            Get.back();
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
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
