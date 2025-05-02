import 'package:flutter/material.dart';

import '../../../../core/widgets/app_bar.dart';
import 'widget/tasks_data_bloc_builder.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Tasks'),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: TasksDataBlocBuilder(),
          ),
        ),
      ),
    );
  }
}
