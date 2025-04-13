import 'package:flutter/material.dart';

import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../../../../../core/widgets/app_card_feat_view.dart';
import '../edit-lead/presentation/edit_campaign_lead.dart';

class LeadActionView extends StatelessWidget {
  final String leadName;
  final int leadId;
  final String leadstatus;
  const LeadActionView({
    super.key,
    required this.leadName,
    required this.leadId,
    required this.leadstatus,
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
                      campaignId: leadId,
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
                onTap: () {
                  // Get.to(
                  //   () =>
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
