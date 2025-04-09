import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Information/logic/cubit/info_campaign_view_cubit.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Information/presentation/widget/information_campaign_details.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/campaign-view/data/model/campaign_view_model.dart';

class InfoCampaignDataBlocBuilder extends StatelessWidget {
  final int campaignId;
  const InfoCampaignDataBlocBuilder({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoCampaignViewCubit, BaseState<CampaignViewModel>>(
      bloc: getIt<InfoCampaignViewCubit>()..getInformationView(campaignId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationCampaignDetails(CampaignViewModel()),
          ),
          success: (CampaignViewModel campaignViewModel) {
            return informationCampaignDetails(campaignViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<InfoCampaignViewCubit>().getInformationView(campaignId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
