import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/leads/lead-view/Timeline/data/model/activity_log_model.dart';

import 'widget/timeline_tile.dart';

class TimelineSccreen extends StatelessWidget {
  final List<ActivityLog> activityLogs;
  const TimelineSccreen({super.key, required this.activityLogs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Timeline'),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        itemCount: activityLogs.length,
        itemBuilder: (context, index) {
          return TimelineTile(
            activityLog: activityLogs[index],
            isLast: index == activityLogs.length - 1,
            isActive: index == 0, // Highlight the first item
          );
        },
      ),
    );
  }
}
