import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_data_table.dart';
import '../../data/model/tasks_model.dart';

Widget tasksLoadingScreen() {
  return Shimmer.fromColors(
    baseColor: R.colors.baseColorShimmer,
    highlightColor: R.colors.highlightColorShimmer,
    enabled: true,
    child: Column(
      children: [
        AppButton(
          icon: SvgPicture.asset(R.icons.add),
          text: 'Create Task',
          onPressed: () {},
        ),
        spacingV(15),
        Row(
          children: [
            Expanded(
              child: AppButton(
                icon: SvgPicture.asset(R.icons.importOptions),
                text: 'Import Options',
                onPressed: () {},
              ),
            ),
            spacingH(8),
            Expanded(
              child: AppButton(
                icon: SvgPicture.asset(R.icons.exportOptions),
                text: 'Export Options',
                onPressed: () {},
              ),
            ),
          ],
        ),
        spacingV(20),
        const AppDataTable<TasksModel>(
          data: [],
          headers: [],
          dataExtractors: [],
        ),
      ],
    ),
  );
}
