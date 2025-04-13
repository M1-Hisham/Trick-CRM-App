import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widget/lead_campaign_data_bloc_builder.dart';

class LeadCampaignScreen extends StatelessWidget {
  final int campaignId;
  const LeadCampaignScreen({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Leads'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: LeadCampaignDataBlocBuilder(campaignId: campaignId),
        ),
      ),
    );
  }
}
