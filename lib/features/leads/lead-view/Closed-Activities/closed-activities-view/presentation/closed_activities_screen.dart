import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../lead-view/logic/cubit/lead_view_cubit.dart';
import '../../closed-calls/presentation/closed_calls_screen.dart';
import '../../closed-tasks/presentation/closed_tasks_screen.dart';
import 'widget/card_lead_view.dart';

class ClosedActivitiesScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const ClosedActivitiesScreen(
      {super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Closed Activities'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            cardActivitesView(
              title: 'Closed Tasks',
              icon: 'ClosedTasks',
              onTap: () {
                Get.to(
                  () => BlocProvider<LeadViewCubit>.value(
                    value: getIt<LeadViewCubit>()..getLeadsView(leadId),
                    child:
                        ClosedTasksScreen(leadId: leadId, leadName: leadName),
                  ),
                );
              },
            ),
            // cardActivitesView(
            //   title: 'Closed Meetings',
            //   icon: 'ClosedMeetings',
            //   onTap: () {
            //     // Get.to(
            //     //   () => BlocProvider<LeadViewCubit>.value(
            //     //     value: getIt<LeadViewCubit>()..getLeadsView(leadId),
            //     //     child:
            //     //         ClosedMeetingsScreen(leadId: leadId, leadName: leadName),
            //     //   ),
            //     // );
            //   },
            // ),
            cardActivitesView(
              title: 'Closed Calls',
              icon: 'ClosedCalls',
              onTap: () {
                Get.to(
                  () => BlocProvider<LeadViewCubit>.value(
                    value: getIt<LeadViewCubit>()..getLeadsView(leadId),
                    child:
                        ClosedCallsScreen(leadId: leadId, leadName: leadName),
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
