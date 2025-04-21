import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_bar.dart';
import 'widget/campaign_deal_data_bloc_builder.dart';

class CampaignDealScreen extends StatelessWidget {
  final int dealId;
  const CampaignDealScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Campaign'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: CampaignDealDataBlocBuilder(dealId: dealId),
        ),
      ),
    );
  }
}
