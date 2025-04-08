import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/core/widgets/app_show_modal_bottom_sheet.dart';
import 'package:trick_crm_app/features/tasks/tasks/data/model/tasks_model.dart';
import 'package:trick_crm_app/features/tasks/tasks/logic/cubit/tasks_cubit.dart';

import '../../../../../core/cubits/base_state.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/resources/resources.dart';
import '../../../../../core/widgets/app_button.dart';
import '../../../../../core/widgets/app_data_table.dart';
import '../../../create-task/presentation/create_task_screen.dart';
import 'tasks_loading_screen.dart';

class TasksDataBlocBuilder extends StatefulWidget {
  const TasksDataBlocBuilder({super.key});

  @override
  State<TasksDataBlocBuilder> createState() => _TasksDataBlocBuilderState();
}

class _TasksDataBlocBuilderState extends State<TasksDataBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, BaseState<TasksModel>>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
            loading: () => tasksLoadingScreen(),
            success: (TasksModel tasksModel) {
              final String? tasksMessage = tasksModel.message;
              final tasks = tasksModel.tasks;
              return Column(
                children: [
                  AppButton(
                    icon: SvgPicture.asset(R.icons.add),
                    text: 'Create Task',
                    onPressed: () async {
                      final result = await appShowModalBottomSheet(
                        context: context,
                        builder: (context) => CreateTaskScreen(
                          tasksModel: tasksModel,
                        ),
                      );
                      if (result == true) {
                        // ignore: use_build_context_synchronously
                        context.read<TasksCubit>().getData();
                      }
                    },
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
                  AppDataTable<Tasks>(
                    dataMessage: tasksMessage,
                    data: tasks ?? [],
                    headers: const [
                      "Subject",
                      "Due Date",
                      "Status",
                      "Priority",
                      "Lead Name",
                      "Contact Name",
                      "Client Name",
                      "Task Owner",
                    ],
                    dataExtractors: [
                      (tasks) => tasks.subject ?? '_',
                      (tasks) => tasks.dueDate ?? '_',
                      (tasks) => tasks.status ?? '_',
                      (tasks) => tasks.priority ?? '_',
                      (tasks) => tasks.lead?.leadName ?? '_',
                      (tasks) => tasks.contact?.contactName ?? '_',
                      (tasks) => tasks.client?.clientName ?? '_',
                      (tasks) => tasks.taskOwner ?? '_',
                    ],
                    dataIdExtractor: (tasks) => (tasks.id ?? 0).toString(),
                    dataLeadNameExtractor: (tasks) => tasks.subject ?? '_',
                    onViewDetails: (id, taskName) {
                      // Get.toNamed(
                      //   RoutesNames.leadsView,
                      //   arguments: id != '' ? int.parse(id) : 0,
                      // );
                    },
                  ),
                ],
              );
            },
            error: (message) => appErrorMessage(
                  message,
                  () {
                    context.read<TasksCubit>().getData();
                  },
                ),
            orElse: () {
              return const SizedBox.shrink();
            });
      },
    );
  }
}
