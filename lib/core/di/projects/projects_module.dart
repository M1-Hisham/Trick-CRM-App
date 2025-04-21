import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/projects/projects/create-project/logic/cubit/create_project_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupProjectsModule() {
  // Create Project instance
  getIt.registerLazySingleton<CreateProjectCubit>(
      () => CreateProjectCubit(getIt<ApiService>()));
}
