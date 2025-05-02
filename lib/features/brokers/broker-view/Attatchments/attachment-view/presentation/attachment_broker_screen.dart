import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_broker_bloc_builder.dart';


class AttachmentBrokerScreen extends StatelessWidget {
  final int brokerId;
  const AttachmentBrokerScreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentBrokerBlocBuilder(brokerId: brokerId),
        ),
      ),
    );
  }
}
