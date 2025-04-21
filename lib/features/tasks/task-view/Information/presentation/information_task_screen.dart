import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/widgets/app_bar.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/presentation/widget/info_task_data_bloc_builder.dart';

class InformationTaskScreen extends StatelessWidget {
  final int taskId;
  const InformationTaskScreen({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Information'),
      body: SingleChildScrollView(
        child: InfoTaskDataBlocBuilder(taskId: taskId),
      ),
    );
  }
}
