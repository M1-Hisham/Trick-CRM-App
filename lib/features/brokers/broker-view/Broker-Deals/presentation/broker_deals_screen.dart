import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_bar.dart';
import 'widget/broker_deals_data_bloc_builder.dart';

class BrokerDealsScreen extends StatelessWidget {
  final int brokerId;
  const BrokerDealsScreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Deals'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: BrokerDealsDataBlocBuilder(brokerId: brokerId),
        ),
      ),
    );
  }
}
