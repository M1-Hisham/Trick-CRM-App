import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/features/leads/lead-view/Information/logic/cubit/information_cubit.dart';

import '../../../../../../core/resources/resources.dart';
import '../../data/model/edit_lead_model.dart';
import 'information_details.dart';

class InformationDataBlocBuilder extends StatelessWidget {
  final int leadId;
  const InformationDataBlocBuilder({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InformationCubit, BaseState<EditLeadModel>>(
      bloc: getIt<InformationCubit>()..getInformation(leadId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => Shimmer.fromColors(
            baseColor: R.colors.baseColorShimmer,
            highlightColor: R.colors.highlightColorShimmer,
            enabled: true,
            child: informationDetails(EditLeadModel()),
          ),
          success: (editLeadModel) {
            return informationDetails(editLeadModel);
          },
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
