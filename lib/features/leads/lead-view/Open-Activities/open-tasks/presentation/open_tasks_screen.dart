import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/data/model/open_activity_model.dart';

import '../../../../../../core/widgets/app_bar.dart';

class OpenTasksScreen extends StatelessWidget {
  final List<OpenActivityModel> openActivityModel;
  const OpenTasksScreen({super.key, required this.openActivityModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Open Tasks'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
            AppDataTable<OpenActivityModel>(
              data: openActivityModel,
              headers: const [
                'Subject',
                'Created By',
                'Due Date',
                'Priority',
                'Status',
              ],
              dataExtractors: const [],
            ),
          ],
        ),
      ),
    );
  }
}
