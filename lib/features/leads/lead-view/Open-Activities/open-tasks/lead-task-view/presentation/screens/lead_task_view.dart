import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/core/widgets/app_waiting_feature.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/presentation/information_task_screen.dart';

import '../../../../../../../../core/widgets/app_button.dart';
import '../../../mark-task/logic/cubit/lead_mark_task_cubit.dart';

class LeadTaskView extends StatelessWidget {
  final int taskId;
  final int leadId;
  final String taskName;
  const LeadTaskView({
    super.key,
    required this.taskName,
    required this.taskId,
    required this.leadId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        taskName,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              AppButton(
                text: "Mark as completed",
                onPressed: () async {
                  appWaitingFeature(context);
                  await getIt<LeadMarkTaskCubit>()
                      .markLeadTaskAsCompleted(leadId, taskId);
                  Get.back();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context, true);
                },
              ),
              spacingV(20),
              // Show Cards
              appCardFeatView(
                title: 'Information',
                icon: 'information',
                onTap: () {
                  Get.to(
                    () => InformationTaskScreen(taskId: taskId),
                  );
                },
              ),
              // appCardFeatView(
              //   title: 'Notes',
              //   icon: 'notes',
              //   onTap: () {
              //     // Get.to(
              //     //     () => NotesScreen(leadNotes: leadNotes ?? [], leadId: leadId));
              //   },
              // ),
              // appCardFeatView(
              //   title: 'Attachments',
              //   icon: 'attachments',
              //   onTap: () {
              //     // Get.to(
              //     //   () => AttachmentScreen(
              //     //     leadAttatchment: leadAttatchments ?? [],
              //     //   ),
              //     // );
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
