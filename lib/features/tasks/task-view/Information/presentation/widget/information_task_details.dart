import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/tasks/delete-task/logic/cubit/delete_task_cubit.dart';
import 'package:trick_crm_app/features/tasks/task-view/task-view/data/model/task_view_model.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/helpers/show_snack_bar.dart';
import '../../../../../../core/helpers/spacing.dart';
import '../../../../../../core/widgets/app_button.dart';
import '../../../../../../core/widgets/app_waiting_feature.dart';

Widget informationTaskDetails(
    int leadId, TaskViewModel taskViewModel, context) {
  final task = taskViewModel.task;
  final userInfo = {
    "Priority": task?.priority ?? "-",
    "Due Date": task?.dueDate ?? "-",
    "Status": task?.status ?? "-",
    "Task Owner": task?.taskOwner ?? "-",
  };

  final taskInfo = {
    "Task Owner": task?.taskOwner ?? "-",
    "Subject": task?.subject ?? "-",
    "Due Date": task?.dueDate ?? "-",
    "Status": task?.status ?? "-",
    "Priority": task?.priority ?? "-",
  };

  final description = {
    "Description": task?.description ?? "-",
  };

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      children: [
        AppButton(
          text: "Mark As Completed",
          onPressed: () async {
            showSnackBar(context, "Comming Soon!");
          },
        ),
        spacingV(12),
        Row(
          children: [
            Expanded(
              child: AppButton(
                text: "Edit",
                onPressed: () {
                  showSnackBar(context, "Comming Soon!");
                },
              ),
            ),
            spacingH(8),
            Expanded(
              child: AppButton(
                text: "Delete",
                backgroundColor: R.colors.red,
                onPressed: () async {
                  appWaitingFeature(context);
                  await getIt<DeleteTaskCubit>().deleteTask(leadId);
                  Get.back();
                  Get.back();
                  Navigator.pop(context, true);
                  // ignore: use_build_context_synchronously
                  showSnackBar(context, 'Task Deleted Successfully');
                },
              ),
            ),
          ],
        ),
        spacingV(12),
        buildFields(userInfo),
        sectionTitle("Task Information"),
        buildFields(taskInfo),
        sectionTitle("Description"),
        buildFields(description),
      ],
    ),
  );
}

/// A function that builds a list of fields from a map of data
Widget buildFields(Map<String, String> data) {
  return Column(
    children: data.entries
        .map((entry) => readOnlyField(entry.key, entry.value))
        .toList(),
  );
}

/// A function that builds a section title
Widget sectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Text(
      title,
      style: R.textStyles.font17PrimaryW600,
    ),
  );
}

/// A function that builds a read-only field with a label and a value
Widget readOnlyField(String label, String value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: AppTextFormField(
      hintText: label,
      labelText: label,
      style: R.textStyles.font15RegentGrayW500.copyWith(
        color: R.colors.black,
      ),
      maxLines: label == "Description" ? 3 : null,
      isclickable: false,
      initialValue: value,
      fillColor: R.colors.white,
    ),
  );
}
