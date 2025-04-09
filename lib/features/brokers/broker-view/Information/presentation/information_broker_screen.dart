import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/info_broker_data_bloc_builder.dart';

class InformationBrokerScreen extends StatelessWidget {
  final int brokerId;
  const InformationBrokerScreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoBrokerDataBlocBuilder(brokerId: brokerId),
      ),
    );
  }
}
