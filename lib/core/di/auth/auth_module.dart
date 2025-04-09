import 'package:trick_crm_app/core/di/setup-di/dependency_injection.dart';
import 'package:trick_crm_app/features/auth/login/data/repos/login_repo.dart';
import 'package:trick_crm_app/features/auth/login/logic/cubit/login_cubit.dart';

void setupAuthModule() {
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
}
