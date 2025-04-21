import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/campaign_timeline_bloc_builder.dart';

class CampaignTimelineSccreen extends StatelessWidget {
  final int campaignId;
  const CampaignTimelineSccreen({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: CampaignTimelineBlocBuilder(
        campaignId: campaignId,
      ),
    );
  }
}
