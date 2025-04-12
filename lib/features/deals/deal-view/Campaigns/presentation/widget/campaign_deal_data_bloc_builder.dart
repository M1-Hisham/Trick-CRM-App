import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../deal-view/data/model/deal_view_model.dart';
import '../../../deal-view/logic/cubit/deal_view_cubit.dart';
import '../../data/model/campaign_deal_view_model.dart';

class CampaignDealDataBlocBuilder extends StatelessWidget {
  final int dealId;
  const CampaignDealDataBlocBuilder({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealViewCubit, BaseState<DealViewModel>>(
      bloc: getIt<DealViewCubit>()..getDealView(dealId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assigned to Campaign',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                const AppDataTable<CampaignDealViewModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (DealViewModel dealViewModel) {
            final String? campaignsMessage = dealViewModel.message;
            final campaigns = dealViewModel.deal?.campaign;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Assigned to Campaign',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                AppDataTable<CampaignDealViewModel>(
                  dataMessage: campaignsMessage,
                  data: campaigns != null ? [campaigns] : [],
                  headers: const [
                    "Name",
                    "Type",
                    "Status",
                    "Start date",
                    "End date",
                  ],
                  dataExtractors: [
                    (campaigns) => campaigns.campaignName ?? '_',
                    (campaigns) => campaigns.type ?? '_',
                    (campaigns) => campaigns.status ?? '_',
                    (campaigns) => campaigns.startDate ?? '_',
                    (campaigns) => campaigns.endDate ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<DealViewCubit>().getDealView(dealId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
