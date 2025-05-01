import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widget/email_lead_data_bloc_builder.dart';

class EmailLeadScreen extends StatelessWidget {
  final int leadId;
  const EmailLeadScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Lead Emails'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: EmailLeadDataBlocBuilder(leadId: leadId),
        ),
      ),
    );
  }
}
