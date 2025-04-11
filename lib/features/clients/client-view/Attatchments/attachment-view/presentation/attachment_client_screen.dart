import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_client_bloc_builder.dart';


class AttachmentClientScreen extends StatelessWidget {
  final int clientId;
  const AttachmentClientScreen({super.key, required this.clientId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentClientBlocBuilder(clientId: clientId),
        ),
      ),
    );
  }
}
