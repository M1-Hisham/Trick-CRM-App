import 'package:flutter/material.dart';

import '../../../../../../../core/widgets/app_bar.dart';
import '../widget/notes_call_data_bloc_builder.dart';

class NotesCallScreen extends StatelessWidget {
  final int callId;
  const NotesCallScreen({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Notes'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: NotesCallDataBlocBuilder(callId: callId),
        ),
      ),
    );
  }
}
