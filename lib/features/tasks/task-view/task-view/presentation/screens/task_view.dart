import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/widgets/app_card_feat_view.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/presentation/information_task_screen.dart';

import '../../../../../../../core/widgets/app_bar.dart';

class TaskView extends StatelessWidget {
  final int taskId;
  final String taskName;
  const TaskView({
    super.key,
    required this.taskName,
    required this.taskId,
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
              // AppButton(
              //   text: "Mark as completed",
              //   onPressed: () {},
              // ),
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
