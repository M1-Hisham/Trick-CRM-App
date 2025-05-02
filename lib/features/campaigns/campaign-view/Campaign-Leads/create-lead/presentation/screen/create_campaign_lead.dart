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
import '../../../../campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../../../leads-view/data/model/lead_campaign_view_model.dart';
import '../../logic/cubit/create_campaign_lead_cubit.dart';

class CreateCampaignLead extends StatelessWidget {
  final int campaignId;
  final List<Lead> leads;
  final BuildContext contextLead;
  CreateCampaignLead({
    super.key,
    required this.campaignId,
    required this.contextLead,
    required this.leads,
  });

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final String? status;
  late final String? leadId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CampaignViewCubit>(),
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
                      'Create a new Lead',
                      style: R.textStyles.font17PrimaryW600,
                    ),
                    spacingV(10),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          AppSelectionFormField(
                            labelText: "Lead",
                            selections: [
                              ...leads.isNotEmpty
                                  ? leads.map((e) => {
                                        "name": "${e.leadName}",
                                        "id": e.id,
                                      })
                                  : [],
                            ],
                            onSaved: (value) {
                              leadId = value;
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
                    _submitAndCancel(contextLead),
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
                await getIt<CreateCampaignLeadCubit>().createCampaignLead(
                  status!,
                  campaignId,
                  int.parse(leadId!),
                );
                Get.back();
                Navigator.pop(contextLead, true);
                Get.showSnackbar(
                  GetSnackBar(
                    backgroundColor: R.colors.primaryColor,
                    message: 'Lead Created Successfully',
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
