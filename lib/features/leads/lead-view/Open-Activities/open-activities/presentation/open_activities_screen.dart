import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import '../../open-calls/data/model/open_call_model.dart';
import '../../open-calls/presentation/open_calls_screen.dart';
import '../data/model/open_activity_model.dart';
import '../../open-meetings/data/model/meeting_model.dart';
import '../../open-meetings/presentation/open_meetings_screen.dart';
import '../../open-tasks/data/model/task_model.dart';
import '../../open-tasks/presentation/open_tasks_screen.dart';
import 'widget/card_lead_view.dart';

class OpenActivitiesScreen extends StatelessWidget {
  final List<OpenActivityModel> openActivityModel;
  final int leadId;
  const OpenActivitiesScreen(
      {super.key, required this.openActivityModel, required this.leadId});

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
                Get.to(
                  () => OpenTasksScreen(
                    taskModel: openActivityModel
                        .map((openActivityModel) => openActivityModel.task)
                        .where((task) => task != null)
                        .cast<TaskModel>()
                        .toList(),
                    leadId: leadId,
                  ),
                );
              },
            ),
            cardActivitesView(
              title: 'Open Meetings',
              icon: 'OpenMeetings',
              onTap: () {
                Get.to(() => OpenMeetingsScreen(
                      meetings: openActivityModel
                          .map((openActivityModel) => openActivityModel.meeting)
                          .where((meeting) => meeting != null)
                          .cast<MeetingModel>()
                          .toList(),
                    ));
              },
            ),
            cardActivitesView(
              title: 'Open Calls',
              icon: 'OpenCalls',
              onTap: () {
                Get.to(() => OpenCallsScreen(
                  callsModel: openActivityModel
                          .map((openActivityModel) => openActivityModel.call)
                          .where((call) => call != null)
                          .cast<OpenCallModel>()
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
