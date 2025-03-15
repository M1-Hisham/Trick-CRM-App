import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/brokers/data/model/brokers_model.dart';
import 'package:trick_crm_app/features/brokers/logic/cubit/brokers_cubit.dart';
import 'package:trick_crm_app/features/calls/data/model/calls_model.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';

class BrokersDataBlocBuilder extends StatelessWidget {
  const BrokersDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokersCubit, BaseState<BrokersModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<Calls>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (BrokersModel brokersModel) {
              final String? brokersMessage = brokersModel.message;
              final brokers = brokersModel.brokers;
              return AppDataTable<Brokers>(
                dataMessage: brokersMessage,
                data: brokers ?? [],
                headers: const [
                  "Broker Name",
                  "Person Name",
                  "mobile",
                  "Broker Owner",
                  "Assigned To",
                  "address",
                  "Current Status	",
                ],
                dataExtractors: [
                  (brokers) => brokers.companyName ?? '_',
                  (brokers) => brokers.personName ?? '_',
                  (brokers) => brokers.mobile ?? '_',
                  (brokers) => brokers.owner?.name ?? '_',
                  (brokers) => brokers.assigned?.name ?? '_',
                  (brokers) => brokers.address ?? '_',
                  //!TODO: add status
                  (brokers) => 'Current',
                ],
                dataIdExtractor: (brokers) => (brokers.id ?? 0).toString(),
                dataLeadNameExtractor: (brokers) => brokers.companyName ?? '_',
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
