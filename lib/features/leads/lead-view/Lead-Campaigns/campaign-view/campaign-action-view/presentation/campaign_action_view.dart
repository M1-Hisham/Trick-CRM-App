import 'package:flutter/material.dart';

import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../../core/widgets/app_card_feat_view.dart';
import '../delete-lead/presentation/delete_lead_campaign.dart';
import '../edit-lead/presentation/edit_lead_campaign.dart';

class CampaignActionView extends StatelessWidget {
  final String campaignName;
  final int campaignId;
  final int leadId;
  final String campaignstatus;
  const CampaignActionView({
    super.key,
    required this.campaignName,
    required this.campaignId,
    required this.leadId,
    required this.campaignstatus,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(campaignName),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Edit Campaign',
                buildIcon: Icon(
                  Icons.edit,
                  color: R.colors.primaryColor,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditLeadCampaign(
                      campaignId: campaignId,
                      leadId: leadId,
                      campaignName: campaignName,
                      campaignstatus: campaignstatus,
                      contextCampaign: context,
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Delete Campaign',
                buildIcon: const Icon(Icons.delete, color: Colors.red),
                onTap: () => deleteLeadCampaign(context, campaignId, leadId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
