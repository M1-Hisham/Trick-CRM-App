import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/attachment_deal_bloc_builder.dart';


class AttachmentDealScreen extends StatelessWidget {
  final int dealId;
  const AttachmentDealScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Attachments'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: AttachmentDealBlocBuilder(dealId: dealId),
        ),
      ),
    );
  }
}
