import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_contact_bloc_builder.dart';

class AttachmentContactScreen extends StatelessWidget {
  final int contactId;
  const AttachmentContactScreen({super.key, required this.contactId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentContactBlocBuilder(contactId: contactId),
        ),
      ),
    );
  }
}
