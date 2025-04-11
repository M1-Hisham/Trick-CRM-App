import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_meeting_bloc_builder.dart';

class AttachmentMeetingScreen extends StatelessWidget {
  final int meetingId;
  const AttachmentMeetingScreen({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentMeetingBlocBuilder(meetingId: meetingId),
        ),
      ),
    );
  }
}
