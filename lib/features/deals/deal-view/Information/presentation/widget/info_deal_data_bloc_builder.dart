import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/presentation/widget/information_deal_details.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';

import '../../../../deals/data/model/deals_model.dart';
import '../../../deal-view/logic/cubit/deal_view_cubit.dart';

class InfoDealDataBlocBuilder extends StatelessWidget {
  final int dealId;
  final DealsModel dealsModel;
  const InfoDealDataBlocBuilder(
      {super.key, required this.dealId, required this.dealsModel});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DealViewCubit, BaseState<DealViewModel>>(
      bloc: getIt<DealViewCubit>()..getDealView(dealId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationDealDetails(
              context,
              DealsModel(),
              DealViewModel(),
            ),
          ),
          success: (DealViewModel dealViewModel) {
            return informationDealDetails(context, dealsModel, dealViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<DealViewCubit>().getDealView(dealId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
