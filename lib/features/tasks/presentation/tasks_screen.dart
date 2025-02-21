import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/resources/resources.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_button.dart';
import 'widget/tasks_data_bloc_builder.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Tasks'),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
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
            const TasksDataBlocBuilder(),
          ],
        ),
      ),
    );
  }
}
