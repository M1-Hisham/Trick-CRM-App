import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/helpers/spacing.dart';
import 'package:trick_crm_app/core/resources/resources.dart';
import 'package:trick_crm_app/core/widgets/app_data_table.dart';
import 'package:trick_crm_app/features/leads/lead-view/lead-view/logic/cubit/lead_view_cubit.dart';
import 'package:trick_crm_app/features/leads/lead-view/Closed-Activities/closed-tasks/data/model/closed_task_model.dart';

import '../../../../../../core/di/setup-di/dependency_injection.dart';
import '../../../../../../core/widgets/app_bar.dart';
import '../../../../../../core/widgets/app_error_message.dart';
import '../../../Open-Activities/open-tasks/lead-task-view/presentation/screens/lead_task_view.dart';
import '../../../lead-view/data/model/leads_view_model.dart';
import '../../closed-activities-view/data/model/closed_activity_model.dart';
import 'widget/loading_closed_tasks_screen.dart';

class ClosedTasksScreen extends StatelessWidget {
  final int leadId;
  final String leadName;
  const ClosedTasksScreen(
      {super.key, required this.leadId, required this.leadName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar('Closed Tasks'),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<LeadViewCubit, BaseState<LeadsViewModel>>(
            buildWhen: (previous, current) =>
                current is Loading || current is Success || current is Error,
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => loadingClosedTasksScreen(),
                success: (LeadsViewModel leadsViewModel) {
                  final List<ClosedActivityModel> closedActivity =
                      leadsViewModel.closedActivity ?? [];
                  final List<ClosedTaskModel> taskModel = closedActivity
                      .map((closedActivityModel) => closedActivityModel.task)
                      .where((task) => task != null)
                      .cast<ClosedTaskModel>()
                      .toList();
                  return Column(
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
                        dataLeadNameExtractor: (tasks) => tasks.subject ?? '_',
                        onViewDetails: (id, taskName) async {
                          final result = await Get.to(
                            () => LeadTaskView(
                              taskName: taskName,
                              leadId: leadId,
                              taskId: int.parse(id),
                            ),
                          );
                          if (result == true) {
                            // ignore: use_build_context_synchronously
                            context.read<LeadViewCubit>().getLeadsView(leadId);
                          }
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
