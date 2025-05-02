import 'package:flutter/material.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../closed-Activities/closed-tasks/data/model/closed_task_model.dart';

loadingClosedTasksScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppDataTable<ClosedTaskModel>(
          dataMessage: 'No Closed Tasks Found',
          data: const [],
          headers: const [
            'Subject',
            'Created By',
            'Due Date',
            'Priority',
            'Status',
          ],
          dataExtractors: [
            (task) => '_',
            (task) => '_',
            (task) => '_',
            (task) => '_',
            (task) => '_',
          ],
          dataIdExtractor: (task) => (task.id ?? 0).toString(),
          dataLeadNameExtractor: (tasks) => tasks.subject ?? '_',
          onViewDetails: (id, taskName) {},
        ),
      ],
    ),
  );
}
