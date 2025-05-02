import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';

import '../../../../../../../core/helpers/spacing.dart';
import '../../../../../../../core/resources/resources.dart';
import '../../../../../../../core/widgets/app_button.dart';
import '../../../../../../../core/widgets/app_data_table.dart';
import '../../../../closed-Activities/closed-tasks/data/model/closed_task_model.dart';

loadingClosedTasksScreen() {
  return loadingShimmer(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create a New Task',
          onPressed: () {},
        ),
        spacingV(20),
        Text(
          "Open Tasks",
          style: R.textStyles.font17PrimaryW600,
        ),
        spacingV(20),
        AppDataTable<ClosedTaskModel>(
          dataMessage: 'No Open Tasks',
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
