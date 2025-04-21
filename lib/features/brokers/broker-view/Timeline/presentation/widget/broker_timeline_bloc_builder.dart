import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';

import '../../../../../../core/helpers/loading_shimmer.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../broker-view/data/model/broker_view_model.dart';
import '../../../broker-view/logic/cubit/broker_view_cubit.dart';
import 'timeline_tile.dart';

class BrokerTimelineBlocBuilder extends StatelessWidget {
  final int brokerId;
  const BrokerTimelineBlocBuilder({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrokerViewCubit, BaseState<BrokerViewModel>>(
      bloc: getIt<BrokerViewCubit>()..getBrokerView(brokerId),
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const TimelineTile(
                  isLast: false,
                  isActive: true,
                  activityLog: null,
                );
              },
            ),
          ),
          success: (data) {
            return data.activityLog?.isEmpty ?? true
                ? Column(
                    children: [
                      spacingV(20),
                      const Center(
                        child: Text('No Data Found'),
                      ),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    itemCount: data.activityLog?.length ?? 0,
                    itemBuilder: (context, index) {
                      return TimelineTile(
                        activityLog: data.activityLog?[index],
                        isLast: data.activityLog?.length == null
                            ? false
                            : index == data.activityLog!.length - 1,
                        isActive: index == 0, // Highlight the first item
                      );
                    },
                  );
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
