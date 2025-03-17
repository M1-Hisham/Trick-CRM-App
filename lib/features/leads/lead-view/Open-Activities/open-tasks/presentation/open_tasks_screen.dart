import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/presentation/screen/create_lead_task.dart';

import '../../../../../../core/widgets/app_bar.dart';
import '../data/model/open_task_model.dart';

class OpenTasksScreen extends StatelessWidget {
  final List<OpenTaskModel> taskModel;
  final int leadId;
  const OpenTasksScreen(
      {super.key, required this.taskModel, required this.leadId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Open Tasks'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                icon: SvgPicture.asset(R.icons.add),
                text: 'Create a New Task',
                onPressed: () {
                  showModalBottomSheet(
                    sheetAnimationStyle: AnimationStyle(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInOutCubicEmphasized,
                      reverseDuration: const Duration(milliseconds: 600),
                    ),
                    useSafeArea: true,
                    isScrollControlled: true,
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(13),
                        topRight: Radius.circular(13),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) => CreateLeadTask(
                      leadId: leadId,
                    ),
                  );
                },
              ),
              spacingV(20),
              Text(
                "Open Tasks",
                style: R.textStyles.font17PrimaryW600,
              ),
              spacingV(20),
              AppDataTable<OpenTaskModel>(
                dataMessage: 'No Open Tasks',
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
