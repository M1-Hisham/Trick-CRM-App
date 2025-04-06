import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/widgets/app_show_modal_bottom_sheet.dart';
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
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateCampaignScreen(
                          campaignOwner: campaignOwner != null
                              ? campaignOwner
                                  .map((e) => {'name': e.name, 'id': e.id})
                                  .toList()
                              : [],
                        ),
                      );
                      if (result == true) {
                        // Refresh the data after creating a new meeting
                        // ignore: use_build_context_synchronously
                        context.read<CampaignsCubit>().getData();
                      }
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
            error: (message) => Center(
                  child: Column(
                    children: [
                      const Text('An error occurred, Try again'),
                      spacingV(10),
                      const Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      spacingV(10),
                      const Text('Please check your internet connection'),
                      spacingV(10),
                      const Text('Or try again later'),
                      spacingV(10),
                      const Text('If the problem persists, contact support'),
                      spacingV(10),
                      Text('Error: $message'),
                      spacingV(10),
                      AppButton(
                        text: 'Retry',
                        onPressed: () {
                          context.read<CampaignsCubit>().getData();
                        },
                      ),
                    ],
                  ),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
