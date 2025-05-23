import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';

import '../../../../../../core/widgets/app_bar.dart';
import '../../../lead-view/logic/cubit/lead_view_cubit.dart';
import '../../open-calls/presentation/open_calls_screen.dart';
import '../../open-meetings/presentation/open_meetings_screen.dart';
import '../../open-tasks/presentation/open_tasks_screen.dart';
import 'widget/card_lead_view.dart';

class OpenActivitiesScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const OpenActivitiesScreen(
      {super.key, required this.leadId, required this.leadName});

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
                  () => BlocProvider<LeadViewCubit>.value(
                    value: getIt<LeadViewCubit>()..getLeadsView(leadId),
                    child: OpenTasksScreen(leadId: leadId, leadName: leadName),
                  ),
                );
              },
            ),
            cardActivitesView(
              title: 'Open Meetings',
              icon: 'OpenMeetings',
              onTap: () {
                Get.to(
                  () => BlocProvider<LeadViewCubit>.value(
                    value: getIt<LeadViewCubit>()..getLeadsView(leadId),
                    child:
                        OpenMeetingsScreen(leadId: leadId, leadName: leadName),
                  ),
                );
              },
            ),
            cardActivitesView(
              title: 'Open Calls',
              icon: 'OpenCalls',
              onTap: () {
                Get.to(
                  () => BlocProvider<LeadViewCubit>.value(
                    value: getIt<LeadViewCubit>()..getLeadsView(leadId),
                    child: OpenCallsScreen(leadId: leadId, leadName: leadName),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
