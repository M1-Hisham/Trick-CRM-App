import 'package:flutter/material.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Campaign-Leads/leads-view/lead-action-view/delete-lead/presentation/delete_campaign_lead.dart';

import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../../core/widgets/app_card_feat_view.dart';
import '../edit-lead/presentation/edit_campaign_lead.dart';

class LeadActionView extends StatelessWidget {
  final String leadName;
  final int leadId;
  final int campaignId;
  final String leadstatus;
  const LeadActionView({
    super.key,
    required this.leadName,
    required this.leadId,
    required this.leadstatus,
    required this.campaignId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(leadName),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              // Show Cards
              appCardFeatView(
                title: 'Edit Lead',
                buildIcon: Icon(
                  Icons.edit,
                  color: R.colors.primaryColor,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => EditCampaignLead(
                      campaignId: campaignId,
                      leadId: leadId,
                      leadName: leadName,
                      leadstatus: leadstatus,
                      contextLead: context,
                    ),
                  );
                },
              ),
              appCardFeatView(
                title: 'Delete Lead',
                buildIcon: const Icon(Icons.delete, color: Colors.red),
                onTap: () => deleteCampaignLead(context, campaignId, leadId),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
