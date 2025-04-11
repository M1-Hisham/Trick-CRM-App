import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/Information/presentation/information_meeting_screen.dart';
import '../../../../../../../core/widgets/app_bar.dart';
import '../../../Attatchments/attachment-view/presentation/attachment_meeting_screen.dart';
import '../../../notes/notes-view/presentation/screen/notes_meeting_screen.dart';

class MeetingView extends StatelessWidget {
  final int meetingId;
  final String meetingName;
  const MeetingView({
    super.key,
    required this.meetingName,
    required this.meetingId,
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
              appCardFeatView(
                title: 'Notes',
                icon: 'notes',
                onTap: () {
                  Get.to(
                    () => NotesMeetingScreen(meetingId: meetingId),
                  );
                },
              ),
              appCardFeatView(
                title: 'Attachments',
                icon: 'attachments',
                onTap: () {
                  Get.to(
                    () => AttachmentMeetingScreen(meetingId: meetingId),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
