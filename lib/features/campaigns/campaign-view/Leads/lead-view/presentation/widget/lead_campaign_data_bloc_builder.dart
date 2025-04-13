import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';

import '../../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../../core/widgets/app_error_message.dart';
import '../../../../campaign-view/data/model/campaign_view_model.dart';
import '../../../../campaign-view/logic/cubit/campaign_view_cubit.dart';
import '../../../create-lead/presentation/screen/create_campaign_lead.dart';
import '../../data/model/lead_campaign_view_model.dart';

class LeadCampaignDataBlocBuilder extends StatelessWidget {
  final int campaignId;
  const LeadCampaignDataBlocBuilder({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignViewCubit, BaseState<CampaignViewModel>>(
      bloc: getIt<CampaignViewCubit>()..getCampaignView(campaignId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  text: "Add Leads",
                  onPressed: () {},
                ),
                spacingV(20),
                const AppDataTable<LeadCampaignViewModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (CampaignViewModel campaignViewModel) {
            final String? message = campaignViewModel.message;
            final List<LeadCampaignViewModel>? leads =
                campaignViewModel.campaignLeads;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppButton(
                  icon: SvgPicture.asset(R.icons.add),
                  text: "Add Leads",
                  onPressed: () async {
                    final result = await showDialog(
                      context: context,
                      builder: (context) {
                        return CreateCampaignLead(
                          campaignId: campaignId,
                          leads: campaignViewModel.leads ?? [],
                          contextLead: context,
                        );
                      },
                    );
                    if (result != null) {
                      getIt<CampaignViewCubit>().getCampaignView(campaignId);
                    }
                  },
                ),
                spacingV(20),
                AppDataTable<LeadCampaignViewModel>(
                  dataMessage: message,
                  data: leads ?? [],
                  headers: const [
                    "Name",
                    "Company",
                    "Email",
                    "Lead Owner",
                    "Lead Status",
                    "Status",
                  ],
                  dataExtractors: [
                    (leads) => leads.lead?.leadName ?? '_',
                    (leads) => leads.lead?.company ?? '_',
                    (leads) => leads.lead?.email ?? '_',
                    (leads) => leads.lead?.ownerName ?? '_',
                    (leads) => leads.lead?.leadStatus ?? '_',
                    (leads) => leads.status ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<CampaignViewCubit>().getCampaignView(campaignId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
