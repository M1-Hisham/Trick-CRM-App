import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_lead_bloc_builder.dart';


class AttachmentLeadScreen extends StatelessWidget {
  final int leadId;
  const AttachmentLeadScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentLeadBlocBuilder(leadId: leadId),
        ),
      ),
    );
  }
}
