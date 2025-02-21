import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trick_crm_app/features/tasks/data/model/tasks_model.dart';
import 'package:trick_crm_app/features/tasks/logic/cubit/tasks_cubit.dart';

import '../../../../core/cubits/base_state.dart';
import '../../../../core/resources/resources.dart';
import '../../../../core/widgets/app_data_table.dart';

class TasksDataBlocBuilder extends StatelessWidget {
  const TasksDataBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, BaseState<TasksModel>>(
      buildWhen: (previous, current) => current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => Shimmer.fromColors(
                  baseColor: R.colors.baseColorShimmer,
                  highlightColor: R.colors.highlightColorShimmer,
                  enabled: true,
                  child: const AppDataTable<TasksModel>(
                    data: [],
                    headers: [],
                    dataExtractors: [],
                  ),
                ),
            success: (TasksModel tasksModel) {
              final String? tasksMessage = tasksModel.message;
              final tasks = tasksModel.tasks;
              return AppDataTable<Tasks>(
                dataMessage: tasksMessage,
                data: tasks ?? [],
                headers: const [
                  "Subject",
                  "Due Date",
                  "Status",
                  "Priority",
                  // "Lead Name",
                  // "Contact Name",
                  // "Client Name",
                  "Task Owner",
                ],
                dataExtractors: [
                  (tasks) => tasks.subject ?? '_',
                  (tasks) => tasks.dueDate ?? '_',
                  (tasks) => tasks.status ?? '_',
                  (tasks) => tasks.priority ?? '_',
                  // () => tasks.lead.leadName ?? '_',
                  // (tasks) => tasks.contact ?? '_',
                  // (tasks) => tasks.client ?? '_',
                  (tasks) => tasks.taskOwner ?? '_',
                ],
                dataIdExtractor: (tasks) => (tasks.id ?? 0).toString(),
                // dataLeadNameExtractor: (tasks) => tasks.leadName ?? '_',
                onViewDetails: (id, leadName) {
                  // Get.toNamed(
                  //   RoutesNames.leadsView,
                  //   arguments: id != '' ? int.parse(id) : 0,
                  // );
                },
              );
            },
            error: (message) => const Center(
                  child: Text('An error occurred, Try again'),
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
