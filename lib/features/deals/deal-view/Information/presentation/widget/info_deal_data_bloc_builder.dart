import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/logic/cubit/info_deal_view_cubit.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/presentation/widget/information_deal_details.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';

class InfoDealDataBlocBuilder extends StatelessWidget {
  final int dealId;
  const InfoDealDataBlocBuilder({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoDealViewCubit, BaseState<DealViewModel>>(
      bloc: getIt<InfoDealViewCubit>()..getInformationView(dealId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationDealDetails(DealViewModel()),
          ),
          success: (DealViewModel dealViewModel) {
            return informationDealDetails(dealViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<InfoDealViewCubit>().getInformationView(dealId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
