import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../broker-view/data/model/broker_view_model.dart';
import '../../../broker-view/logic/cubit/broker_view_cubit.dart';
import '../../data/model/broker_deals_model.dart';

class BrokerDealsDataBlocBuilder extends StatelessWidget {
  final int brokerId;
  const BrokerDealsDataBlocBuilder({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerViewCubit, BaseState<BrokerViewModel>>(
      bloc: getIt<BrokerViewCubit>()..getBrokerView(brokerId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Broker deals',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                const AppDataTable<BrokerDealsModel>(
                  data: [],
                  headers: [],
                  dataExtractors: [],
                ),
              ],
            ),
          ),
          success: (BrokerViewModel brokerViewModel) {
            final deals = brokerViewModel.brokerDeals;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Broker Deals',
                  style: R.textStyles.font17PrimaryW600,
                ),
                spacingV(20),
                AppDataTable<BrokerDealsModel>(
                  dataMessage: "No Data",
                  data: deals ?? [],
                  headers: const [
                    "Name",
                    "client name",
                    "project name",
                    "Unit code",
                    "Deal Owner",
                  ],
                  dataExtractors: [
                    (deals) => deals.dealName ?? '_',
                    (deals) => deals.client?.clientName ?? '_',
                    (deals) => deals.project?.name ?? '_',
                    (deals) => deals.unit?.unitCode ?? '_',
                    (deals) => deals.owner?.name ?? '_',
                  ],
                ),
              ],
            );
          },
          error: (message) => appErrorMessage(
            message,
            () => getIt<BrokerViewCubit>().getBrokerView(brokerId),
          ),
          orElse: () {
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
