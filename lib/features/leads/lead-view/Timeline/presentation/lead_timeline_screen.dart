import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/lead_timeline_bloc_builder.dart';

class LeadTimelineScreen extends StatelessWidget {
  final int leadId;
  const LeadTimelineScreen({super.key, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: LeadTimelineBlocBuilder(leadId: leadId),
    );
  }
}
