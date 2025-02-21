import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import 'widget/card_lead_view.dart';

class OpenActivitiesScreen extends StatelessWidget {
  const OpenActivitiesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Open Activities'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            cardActivitesView(
              title: 'Open Tasks',
              icon: 'OpenTasks',
              onTap: () {
                // Get.to(() => OpenTasksScreen());
              },
            ),
            cardActivitesView(
              title: 'Open Meetings',
              icon: 'OpenMeetings',
              onTap: () {
                // Get.to(() => OpenMeetingsScreen());
              },
            ),
            cardActivitesView(
              title: 'Open Calls',
              icon: 'OpenCalls',
              onTap: () {
                // Get.to(() => OpenCallsScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
