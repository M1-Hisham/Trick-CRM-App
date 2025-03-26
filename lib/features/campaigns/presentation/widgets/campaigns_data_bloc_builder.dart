import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/features/campaigns/logic/cubit/campaigns_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../create-campaign/presentation/create_campaign_screen.dart';
import '../../model/campaigns_model.dart';
import 'campaign_screen_loading.dart';

class CampaignsDataBlocBuilder extends StatelessWidget {
  const CampaignsDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CampaignsCubit, BaseState<CampaignsModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => campaignScreenLoading(),
            success: (CampaignsModel campaignsModel) {
              final String? campaignsMessage = campaignsModel.message;
              final campaigns = campaignsModel.campaigns;
              final List<Users>? campaignOwner = campaignsModel.users;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Campaign',
                    onPressed: () {
                      showModalBottomSheet(
                        sheetAnimationStyle: AnimationStyle(
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeInOutCubicEmphasized,
                          reverseDuration: const Duration(milliseconds: 600),
                        ),
                        useSafeArea: true,
                        isScrollControlled: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(13),
                            topRight: Radius.circular(13),
                          ),
                        ),
                        context: context,
                        builder: (BuildContext context) => CreateCampaignScreen(
                          campaignOwner: campaignOwner!
                              .map((e) => {'name': e.name, 'id': e.id})
                              .toList(),
                        ),
                      );
                    },
                  ),
                  spacingV(20),
                  AppDataTable<Campaigns>(
                    dataMessage: campaignsMessage,
                    data: campaigns ?? [],
                    headers: const [
                      "Campaigns Name",
                      "Type",
                      "Status",
                      "Start date",
                      "End date",
                      "Campaign Owner",
                    ],
                    dataExtractors: [
                      (campaigns) => campaigns.campaignName ?? '_',
                      (campaigns) => campaigns.type ?? '_',
                      (campaigns) => campaigns.status ?? '_',
                      (campaigns) => campaigns.startDate ?? '_',
                      (campaigns) => campaigns.endDate ?? '_',
                      (campaigns) => campaigns.campaignOwner ?? '_',
                    ],
                    dataIdExtractor: (campaigns) =>
                        (campaigns.id ?? 0).toString(),
                    dataLeadNameExtractor: (campaigns) =>
                        campaigns.campaignName ?? '',
                    onViewDetails: (id, leadName) {
                      // Get.toNamed(
                      //   RoutesNames.leadsView,
                      //   arguments: id != '' ? int.parse(id) : 0,
                      // );
                    },
                  ),
                ],
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
