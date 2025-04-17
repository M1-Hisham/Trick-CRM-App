import 'package:flutter/material.dart';

import '../../../../../../core/widgets/app_bar.dart';
import 'widget/campaign_lead_data_bloc_builder.dart';

class CampaignLeadScreen extends StatelessWidget {
  final int leadId;
  const CampaignLeadScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Campaigns'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: CampaignLeadDataBlocBuilder(leadId: leadId),
        ),
      ),
    );
  }
}
