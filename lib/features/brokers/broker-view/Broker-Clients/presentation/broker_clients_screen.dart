import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_bar.dart';
import 'widget/broker_client_data_bloc_builder.dart';

class BrokerClientsScreen extends StatelessWidget {
  final int brokerId;
  const BrokerClientsScreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Clients'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: BrokerClientDataBlocBuilder(brokerId: brokerId),
        ),
      ),
    );
  }
}
