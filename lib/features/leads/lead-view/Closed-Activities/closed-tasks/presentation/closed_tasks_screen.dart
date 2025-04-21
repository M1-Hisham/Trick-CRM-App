import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';

import '../../../../../../core/widgets/app_bar.dart';
import '../data/model/closed_task_model.dart';

class ClosedTasksScreen extends StatelessWidget {
  final List<ClosedTaskModel> taskModel;
  final int leadId;
  const ClosedTasksScreen(
      {super.key, required this.taskModel, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Closed Tasks'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Closed Tasks",
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppDataTable<ClosedTaskModel>(
                dataMessage: 'No Closed Tasks',
                data: taskModel,
                headers: const [
                  'Subject',
                  'Created By',
                  'Due Date',
                  'Priority',
                  'Status',
                ],
                dataExtractors: [
                  (task) => task.subject ?? '_',
                  (task) => task.taskOwner ?? '_',
                  (task) => task.dueDate ?? '_',
                  (task) => task.priority ?? '_',
                  (task) => task.status ?? '_',
                ],
                dataIdExtractor: (task) => (task.id ?? 0).toString(),
                onViewDetails: (id, leadName) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
