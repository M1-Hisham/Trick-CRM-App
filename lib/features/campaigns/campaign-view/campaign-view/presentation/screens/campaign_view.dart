import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Information/presentation/information_campaign_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';

class CampaignView extends StatelessWidget {
  final int campaignId;
  final String campaignName;
  const CampaignView({
    super.key,
    required this.campaignName,
    required this.campaignId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        campaignName,
      ),
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
                    () => InformationCampaignScreen(campaignId: campaignId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Timeline',
                icon: 'timeline',
                onTap: () {
                  // Get.to(() => TimelineSccreen(
                  //       activityLogs: activityLogs ?? [],
                  //     ));
                },
              ),
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  // Get.to(
                  //     () => NotesScreen(leadNotes: leadNotes ?? [], leadId: leadId));
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  // Get.to(
                  //   () => AttachmentScreen(
                  //     leadAttatchment: leadAttatchments ?? [],
                  //   ),
                  // );
                },
              ),
              appCardFeatView(
                title: 'Email',
                icon: 'Emails',
                onTap: () {
                  // Get.to(() => const EmailsScreen());
                },
              ),
              appCardFeatView(
                title: 'Open Activities',
                icon: 'openActivities',
                onTap: () {
                  // Get.to(
                  //   () => OpenActivitiesScreen(
                  //     openActivityModel: openActivity ?? [],
                  //     leadId: leadId,
                  //   ),
                  // );
                },
              ),
              appCardFeatView(
                title: 'Closed Activities',
                icon: 'closedActivities',
                onTap: () {
                  // Get.to(
                  //   () => ClosedActivitiesScreen(
                  //     closedActivityModel: closedActivityModel ?? [],
                  //     leadId: leadId,
                  //   ),
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
