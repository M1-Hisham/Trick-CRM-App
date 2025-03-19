import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/resources/resources.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_data_table.dart';
import '../data/model/campaign_leads_model.dart';
import '../../create-campaigns/presentation/add_campaign.dart';
import '../data/model/campaigns_model.dart';

class CampaignsScreen extends StatelessWidget {
  final List<CampaignLeadsModel> campaignLeads;
  final List<CampaignsModel> campaignsModel;
  final int leadId;
  const CampaignsScreen({super.key, required this.campaignLeads, required this.leadId, required this.campaignsModel});

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
                      campaignsModel: campaignsModel,
                      leadId: leadId,
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
            AppDataTable<CampaignLeadsModel>(
              data: campaignLeads,
              headers: const [
                'Campaign Name',
                'Type',
                'Campaign Status',
                'Start date',
                'End date',
                'Status',
              ],
              dataExtractors: [
                (data) => data.campaign?.campaignName ?? '',
                (data) => data.campaign?.type ?? '',
                (data) => data.campaign?.status ?? '',
                (data) => data.campaign?.startDate ?? '',
                (data) => data.campaign?.endDate ?? '',
                (data) => data.status ?? '',
              ],
            ),
          ],
        ),
      ),
    );
  }
}
