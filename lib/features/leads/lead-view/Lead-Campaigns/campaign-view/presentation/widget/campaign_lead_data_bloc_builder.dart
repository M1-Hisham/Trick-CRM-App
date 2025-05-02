import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/features/leads/lead-view/Lead-Campaigns/create-campaign/presentation/screen/create_lead_campaign.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../../lead-view/data/model/leads_view_model.dart';
import '../../../../lead-view/logic/cubit/lead_view_cubit.dart';
import '../../campaign-action-view/presentation/campaign_action_view.dart';
import '../../data/model/campaign_leads_model.dart';

class CampaignLeadDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const CampaignLeadDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
      bloc: getIt<LeadViewCubit>()..getLeadsView(leadId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  text: "Add Campaign",
                  onPressed: () {},
                ),
                spacingV(20),
                const AppDataTable<CampaignLeadsModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (LeadsViewModel leadsViewModel) {
            final List<CampaignLeadsModel> campaigns =
                leadsViewModel.campaignLeads ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  icon: SvgPicture.asset(R.icons.add),
                  text: "Add Campaign",
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateLeadCampaign(
                          leadId: leadId,
                          campaigns: leadsViewModel.campaigns ?? [],
                          contextCampaign: context,
                        );
                      },
                    );
                    if (result != null) {
                      getIt<LeadViewCubit>().getLeadsView(leadId);
                    }
                  },
                ),
                spacingV(20),
                AppDataTable<CampaignLeadsModel>(
                  dataMessage: 'No Campaigns',
                  data: campaigns,
                  headers: const [
                    "Name",
                    "Type",
                    "Campaign Status",
                    "Start date",
                    "End date",
                    "Status",
                  ],
                  dataExtractors: [
                    (campaigns) => campaigns.campaign?.campaignName ?? '_',
                    (campaigns) => campaigns.campaign?.type ?? '_',
                    (campaigns) => campaigns.campaign?.status ?? '_',
                    (campaigns) => campaigns.campaign?.startDate ?? '_',
                    (campaigns) => campaigns.campaign?.endDate ?? '_',
                    (campaigns) => campaigns.status ?? '_',
                  ],
                  dataIdExtractor: (campaigns) =>
                      (campaigns.id ?? 0).toString(),
                  dataLeadNameExtractor: (campaigns) =>
                      campaigns.campaign?.campaignName ?? '',
                  onViewDetails: (id, campaignName) async {
                    final result = await Get.to(
                      () => CampaignActionView(
                        campaignName: campaignName,
                        leadId: leadId,
                        campaignId: int.parse(id),
                        campaignstatus: campaigns
                                .where((e) => e.id == int.parse(id))
                                .first
                                .status ??
                            "",
                      ),
                    );
                    if (result != null) {
                      getIt<LeadViewCubit>().getLeadsView(leadId);
                    }
                  },
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<LeadViewCubit>().getLeadsView(leadId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
