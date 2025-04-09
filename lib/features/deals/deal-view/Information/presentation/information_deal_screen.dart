import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/deals/deal-view/Information/presentation/widget/info_deal_data_bloc_builder.dart';

class InformationDealScreen extends StatelessWidget {
  final int dealId;
  const InformationDealScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoDealDataBlocBuilder(dealId: dealId),
      ),
    );
  }
}
