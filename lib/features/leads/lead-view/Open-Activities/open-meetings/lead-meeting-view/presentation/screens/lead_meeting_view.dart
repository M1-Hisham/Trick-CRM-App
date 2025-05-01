import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';

import '../../../../../../../meetings/meeting-view/Information/presentation/information_meeting_screen.dart';


class LeadMeetingView extends StatelessWidget {
  final int meetingId;
  final int leadId;
  final String meetingName;
  const LeadMeetingView({
    super.key,
    required this.meetingName,
    required this.meetingId,
    required this.leadId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        meetingName,
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
                    () => InformationMeetingScreen(meetingId: meetingId),
                  );
                },
              ),
              // appCardFeatView(
              //   title: 'Notes',
              //   icon: 'notes',
              //   onTap: () {
              //     // Get.to(
              //     //     () => NotesScreen(leadNotes: leadNotes ?? [], leadId: leadId));
              //   },
              // ),
              // appCardFeatView(
              //   title: 'Attachments',
              //   icon: 'attachments',
              //   onTap: () {
              //     // Get.to(
              //     //   () => AttachmentScreen(
              //     //     leadAttatchment: leadAttatchments ?? [],
              //     //   ),
              //     // );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
