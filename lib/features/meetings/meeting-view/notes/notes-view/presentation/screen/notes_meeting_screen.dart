import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_meeting_data_bloc_builder.dart';

class NotesMeetingScreen extends StatelessWidget {
  final int meetingId;
  const NotesMeetingScreen({super.key, required this.meetingId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesMeetingDataBlocBuilder(meetingId: meetingId),
        ),
      ),
    );
  }
}
