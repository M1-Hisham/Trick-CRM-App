import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_button.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/core/widgets/app_show_modal_bottom_sheet.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-activities-view/data/model/open_activity_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/presentation/screen/create_lead_task.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/presentation/widget/loading_open_tasks_screen.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../../../tasks/task-view/task-view/presentation/screens/task_view.dart';
import '../../../lead-view/data/model/leads_view_model.dart';
import '../data/model/open_task_model.dart';

class OpenTasksScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const OpenTasksScreen(
      {super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Open Tasks'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => loadingOpenTasksScreen(),
                success: (LeadsViewModel leadsViewModel) {
                  final List<OpenActivityModel> openActivity =
                      leadsViewModel.openActivity ?? [];
                  final List<OpenTaskModel> taskModel = openActivity
                      .map((openActivityModel) => openActivityModel.task)
                      .where((task) => task != null)
                      .cast<OpenTaskModel>()
                      .toList();
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppButton(
                        icon: SvgPicture.asset(R.icons.add),
                        text: 'Create a New Task',
                        onPressed: () async {
                          final result = await appShowModalBottomSheet(
                            context: context,
                            builder: (context) => CreateLeadTask(
                              leadId: leadId,
                              leadName: leadName,
                              users: leadsViewModel.users ?? [],
                            ),
                          );
                          if (result != null) {
                            // ignore: use_build_context_synchronously
                            context.read<LeadViewCubit>().getLeadsView(leadId);
                          }
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
                        dataLeadNameExtractor: (tasks) => tasks.subject ?? '_',
                        onViewDetails: (id, taskName) {
                          Get.to(
                            () => TaskView(
                              taskName: taskName,
                              taskId: int.parse(id),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                error: (error) {
                  return appErrorMessage(
                    error,
                    () {
                      getIt<LeadViewCubit>().getLeadsView(leadId);
                    },
                  );
                },
                orElse: () => const SizedBox.shrink(),
              );
            },
          ),
        ),
      ),
    );
  }
}
