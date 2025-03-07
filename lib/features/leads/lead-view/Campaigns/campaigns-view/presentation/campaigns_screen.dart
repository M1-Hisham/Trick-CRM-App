import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../../create-campaigns/data/model/campaign_leads_model.dart';
import '../../create-campaigns/presentation/add_campaign.dart';
import '../data/model/campaigns_model.dart';

class CampaignsScreen extends StatelessWidget {
  final List<CampaignsModel> campaigns;
  final List<CampaignLeadsModel> campaignLeads;
  const CampaignsScreen(
      {super.key, required this.campaigns, required this.campaignLeads});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Campaigns'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButton(
              icon: SvgPicture.asset(R.icons.add),
              text: 'Add Campaigns',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AddCampaign(
                      campaignLeads: campaignLeads,
                    );
                  },
                );
              },
            ),
            spacingV(20),
            Text(
              'Campaigns',
              style: R.textStyles.font17PrimaryW600,
            ),
            spacingV(10),
            AppDataTable<CampaignsModel>(
              data: campaigns,
              headers: const [
                'Campaign Name',
                'Type',
                'Campaign Status',
                'Start date',
                'End date',
                'Status',
              ],
              dataExtractors: [
                (data) => data.campaignName ?? '',
                (data) => data.type ?? '',
                (data) => data.status ?? '',
                (data) => data.startDate ?? '',
                (data) => data.endDate ?? '',
                (data) => data.status ?? '',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
