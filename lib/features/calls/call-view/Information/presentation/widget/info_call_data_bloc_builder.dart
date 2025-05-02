import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/calls/call-view/Information/presentation/widget/information_call_details.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/data/model/call_view_model.dart';

import '../../../call-view/logic/cubit/call_view_cubit.dart';

class InfoCallDataBlocBuilder extends StatelessWidget {
  final int callId;
  const InfoCallDataBlocBuilder({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CallViewCubit, BaseState<CallViewModel>>(
      bloc: getIt<CallViewCubit>()..getCallView(callId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationCallDetails(CallViewModel(), context),
          ),
          success: (CallViewModel callViewModel) {
            return informationCallDetails(callViewModel, context);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<CallViewCubit>().getCallView(callId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
