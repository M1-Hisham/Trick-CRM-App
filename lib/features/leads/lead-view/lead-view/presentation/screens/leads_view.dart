import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_card_feat_view.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_lead_screen.dart';
import '../../../Information/presentation/information_lead_screen.dart';
import '../../../Lead-Campaigns/campaign-view/presentation/campaign_lead_screen.dart';
import '../../../Open-Activities/open-activities-view/presentation/open_activities_screen.dart';
import '../../../Timeline/presentation/lead_timeline_screen.dart';
import '../../../notes/notes-view/presentation/screen/notes_lead_screen.dart';

class LeadView extends StatelessWidget {
  final int leadId;
  final String leadName;
  const LeadView({super.key, required this.leadId, required this.leadName});

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
                title: 'Information',
                icon: 'information',
                onTap: () {
                  Get.to(
                    () => InformationLeadScreen(leadId: leadId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  Get.to(
                    () => LeadTimelineScreen(leadId: leadId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesLeadScreen(leadId: leadId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentLeadScreen(leadId: leadId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Campaigns',
                icon: 'Campaigns',
                onTap: () {
                  Get.to(
                    () => CampaignLeadScreen(leadId: leadId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Email',
                icon: 'Emails',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
              appCardFeatView(
                title: 'Open Activities',
                icon: 'openActivities',
                onTap: () {
                  Get.to(
                    () => OpenActivitiesScreen(
                        leadId: leadId, leadName: leadName),
                  );
                },
              ),
              appCardFeatView(
                title: 'Closed Activities',
                icon: 'closedActivities',
                onTap: () {
                  showSnackBar(context, "Coming soon!");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
