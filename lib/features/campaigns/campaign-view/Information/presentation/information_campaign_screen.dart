import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Information/presentation/widget/info_campaign_data_bloc_builder.dart';

class InformationCampaignScreen extends StatelessWidget {
  final int campaignId;
  const InformationCampaignScreen({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoCampaignDataBlocBuilder(campaignId: campaignId),
      ),
    );
  }
}
