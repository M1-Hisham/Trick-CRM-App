import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/deal_timeline_bloc_builder.dart';

class DealTimelineSccreen extends StatelessWidget {
  final int dealId;
  const DealTimelineSccreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: DealTimelineBlocBuilder(
        dealId: dealId,
      ),
    );
  }
}
