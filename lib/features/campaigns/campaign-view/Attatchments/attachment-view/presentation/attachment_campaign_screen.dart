import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_campaign_bloc_builder.dart';


class AttachmentCampaignScreen extends StatelessWidget {
  final int campaignId;
  const AttachmentCampaignScreen({super.key, required this.campaignId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentCampaignBlocBuilder(campaignId: campaignId),
        ),
      ),
    );
  }
}
