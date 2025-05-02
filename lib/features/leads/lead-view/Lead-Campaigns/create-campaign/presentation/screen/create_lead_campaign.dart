import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_selection_form_field.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../lead-view/logic/cubit/lead_view_cubit.dart';
import '../../../campaign-view/data/model/campaigns_model.dart';
import '../../logic/cubit/create_lead_campaign_cubit.dart';

class CreateLeadCampaign extends StatelessWidget {
  final int leadId;
  final List<CampaignsModel> campaigns;
  final BuildContext contextCampaign;
  CreateLeadCampaign({
    super.key,
    required this.leadId,
    required this.contextCampaign,
    required this.campaigns,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final String? status;
  late final String? campaignId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LeadViewCubit>(),
      child: Dialog(
        backgroundColor: R.colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: SingleChildScrollView(
          child: Wrap(
            alignment: WrapAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Create a new Campaign',
                      style: R.textStyles.font17PrimaryW600,
                    ),
                    spacingV(10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSelectionFormField(
                            labelText: "Campaign",
                            selections: [
                              ...campaigns.isNotEmpty
                                  ? campaigns.map((e) => {
                                        "name": "${e.campaignName}",
                                        "id": e.id,
                                      })
                                  : [],
                            ],
                            onSaved: (value) {
                              campaignId = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a selection';
                              }
                              return null;
                            },
                          ),
                          spacingV(20),
                          AppSelectionFormField(
                            labelText: "Status",
                            selections: const [
                              "Planned",
                              "Invited",
                              "Sent",
                              "Opened",
                              "Responded",
                              "Bounced",
                              "Opted Out",
                            ],
                            onSaved: (value) {
                              status = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please select a selection';
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
                    spacingV(20),

                    /// Submit and Cancel Button
                    _submitAndCancel(contextCampaign),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _submitAndCancel(contextLead) {
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
                appWaitingFeature(contextLead);
                await getIt<CreateLeadCampaignCubit>().createLeadCampaign(
                  status!,
                  int.tryParse(campaignId!)!,
                  leadId,
                );
                Get.back();
                Navigator.pop(contextLead, true);
                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Campaign Created Successfully',
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
