import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/data/model/leads_view_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';

import '../../../../../../core/widgets/app_error_message.dart';
import 'information_lead_details.dart';

class InformationLeadDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const InformationLeadDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
      bloc: getIt<LeadViewCubit>()..getLeadsView(leadId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationLeadDetails(LeadsViewModel()),
          ),
          success: (LeadsViewModel leadsViewModel) {
            return informationLeadDetails(leadsViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<LeadViewCubit>().getLeadsView(leadId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
