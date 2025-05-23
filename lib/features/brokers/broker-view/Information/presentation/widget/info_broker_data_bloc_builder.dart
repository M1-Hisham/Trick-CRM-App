import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/brokers/broker-view/broker-view/data/model/broker_view_model.dart';

import '../../../broker-view/logic/cubit/broker_view_cubit.dart';
import 'information_broker_details.dart';

class InfoBrokerDataBlocBuilder extends StatelessWidget {
  final int brokerId;
  const InfoBrokerDataBlocBuilder({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerViewCubit, BaseState<BrokerViewModel>>(
      bloc: getIt<BrokerViewCubit>()..getBrokerView(brokerId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationBrokerDetails(BrokerViewModel()),
          ),
          success: (BrokerViewModel brokerViewModel) {
            return informationBrokerDetails(brokerViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<BrokerViewCubit>().getBrokerView(brokerId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
