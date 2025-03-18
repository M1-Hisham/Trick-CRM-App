import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import '../../closed-calls/data/model/closed_call_model.dart';
import '../../closed-calls/presentation/closed_calls_screen.dart';
import '../../closed-tasks/data/model/closed_task_model.dart';
import '../../closed-tasks/presentation/closed_tasks_screen.dart';
import '../data/model/closed_activity_model.dart';
import 'widget/card_lead_view.dart';

class ClosedActivitiesScreen extends StatelessWidget {
  final List<ClosedActivityModel> closedActivityModel;
  final int leadId;
  const ClosedActivitiesScreen(
      {super.key, required this.closedActivityModel, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('closed Activities'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            cardActivitesView(
              title: 'closed Tasks',
              icon: 'ClosedTasks',
              onTap: () {
                Get.to(
                  () => ClosedTasksScreen(
                    taskModel: closedActivityModel
                        .map((closedActivityModel) => closedActivityModel.task)
                        .where((task) => task != null)
                        .cast<ClosedTaskModel>()
                        .toList(),
                    leadId: leadId,
                  ),
                );
              },
            ),
            cardActivitesView(
              title: 'closed Meetings',
              icon: 'ClosedMeetings',
              onTap: () {
                // Get.to(() => closedMeetingsScreen(
                //       meetings: closedActivityModel
                //           .map((closedActivityModel) => closedActivityModel.meeting)
                //           .where((meeting) => meeting != null)
                //           .cast<closedMeetingModel>()
                //           .toList(),
                //     ));
              },
            ),
            cardActivitesView(
              title: 'closed Calls',
              icon: 'ClosedCalls',
              onTap: () {
                Get.to(() => ClosedCallsScreen(
                      callsModel: closedActivityModel
                          .map(
                              (closedActivityModel) => closedActivityModel.call)
                          .where((call) => call != null)
                          .cast<ClosedCallModel>()
                          .toList(),
                      leadId: leadId,
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
