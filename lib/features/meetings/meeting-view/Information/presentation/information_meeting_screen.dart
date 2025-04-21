import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/Information/presentation/widget/info_meeting_data_bloc_builder.dart';

class InformationMeetingScreen extends StatelessWidget {
  final int meetingId;
  const InformationMeetingScreen({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoMeetingDataBlocBuilder(meetingId: meetingId),
      ),
    );
  }
}
