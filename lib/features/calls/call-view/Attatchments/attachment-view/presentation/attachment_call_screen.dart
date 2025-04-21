import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_call_bloc_builder.dart';

class AttachmentCallScreen extends StatelessWidget {
  final int callId;
  const AttachmentCallScreen({super.key, required this.callId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentCallBlocBuilder(callId: callId),
        ),
      ),
    );
  }
}
