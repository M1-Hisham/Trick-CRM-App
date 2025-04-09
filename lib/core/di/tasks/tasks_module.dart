import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/tasks/create-task/logic/cubit/create_task_cubit.dart';
import 'package:trick_crm_app/features/tasks/task-view/Information/logic/cubit/info_task_view_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupTasksModule() {
  // Create Task instance
  getIt.registerLazySingleton<CreateTaskCubit>(
      () => CreateTaskCubit(getIt<ApiService>()));

  // Information Task View instance
  getIt.registerLazySingleton<InfoTaskViewCubit>(
      () => InfoTaskViewCubit(getIt<ApiService>()));
}
