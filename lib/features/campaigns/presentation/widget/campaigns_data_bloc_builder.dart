import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/campaigns/logic/cubit/campaigns_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../model/campaigns_model.dart';

class CampaignsDataBlocBuilder extends StatelessWidget {
  const CampaignsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignsCubit, BaseState<CampaignsModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Campaigns>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (CampaignsModel campaignsModel) {
              final String? campaignsMessage = campaignsModel.message;
              final campaigns = campaignsModel.campaigns;
              return AppDataTable<Campaigns>(
                dataMessage: campaignsMessage,
                data: campaigns ?? [],
                headers: const [
                  "Campaigns Name",
                  "Type",
                  "Status",
                  "Start date",
                  "End date",
                  "Campaign Owner",
                ],
                dataExtractors: [
                  (campaigns) => campaigns.campaignName ?? '_',
                  (campaigns) => campaigns.type ?? '_',
                  (campaigns) => campaigns.status ?? '_',
                  (campaigns) => campaigns.startDate ?? '_',
                  (campaigns) => campaigns.endDate ?? '_',
                  (campaigns) => campaigns.campaignOwner ?? '_',
                ],
                dataIdExtractor: (campaigns) => (campaigns.id ?? 0).toString(),
                dataLeadNameExtractor: (campaigns) =>
                    campaigns.campaignName ?? '',
                onViewDetails: (id, leadName) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
