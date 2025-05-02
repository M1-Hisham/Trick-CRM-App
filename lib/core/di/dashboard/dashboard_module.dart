import 'package:trick_crm_app/features/home/data/repo/dashboard_repo.dart';

import '../setup-di/dependency_injection.dart';

void setupDashboardModule() {
  // dashboard repo instance
  getIt.registerLazySingleton<DashboardRepo>(() => DashboardRepo(getIt()));
}
