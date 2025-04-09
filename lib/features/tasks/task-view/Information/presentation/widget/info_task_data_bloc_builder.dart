import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trick_crm_app/core/cubits/base_state.dart';
import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/core/helpers/loading_shimmer.dart';
import 'package:trick_crm_app/core/widgets/app_error_message.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/logic/cubit/info_task_view_cubit.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/presentation/widget/information_task_details.dart';
import 'package:trick_crm_app/features/tasks/task-view/task-view/data/model/task_view_model.dart';

class InfoTaskDataBlocBuilder extends StatelessWidget {
  final int taskId;
  const InfoTaskDataBlocBuilder({super.key, required this.taskId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InfoTaskViewCubit, BaseState<TaskViewModel>>(
      bloc: getIt<InfoTaskViewCubit>()..getInformationView(taskId),
      buildWhen: (previous, current) =>
          current is Success || current is Loading || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => loadingShimmer(
            child: informationTaskDetails(TaskViewModel()),
          ),
          success: (TaskViewModel taskViewModel) {
            return informationTaskDetails(taskViewModel);
          },
          error: (message) => appErrorMessage(
            message,
            () {
              getIt<InfoTaskViewCubit>().getInformationView(taskId);
            },
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }
}
