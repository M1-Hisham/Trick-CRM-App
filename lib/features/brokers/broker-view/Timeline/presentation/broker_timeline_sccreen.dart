import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/broker_timeline_bloc_builder.dart';

class BrokerTimelineSccreen extends StatelessWidget {
  final int brokerId;
  const BrokerTimelineSccreen({super.key, required this.brokerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: BrokerTimelineBlocBuilder(
        brokerId: brokerId,
      ),
    );
  }
}
