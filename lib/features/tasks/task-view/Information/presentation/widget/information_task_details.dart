import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_text_form_field.dart';
import 'package:trick_crm_app/features/tasks/task-view/task-view/data/model/task_view_model.dart';

Widget informationTaskDetails(TaskViewModel taskViewModel) {
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
