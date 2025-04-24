import 'package:trick_crm_app/features/profile/Company/update-company/logic/cubit/update_company_cubit.dart';

import '../../../features/profile/General-Info/update-general-info/logic/cubit/update_general_info_cubit.dart';
import '../../../features/profile/Recycle-Bin/restore/logic/cubit/restore_cubit.dart';
import '../../api/api_service.dart';
import '../setup-di/dependency_injection.dart';

void setupProfileModule() {
  // Update Company
  getIt.registerLazySingleton<UpdateCompanyCubit>(
      () => UpdateCompanyCubit(getIt<ApiService>()));

  // Update General Info
  getIt.registerLazySingleton<UpdateGeneralInfoCubit>(
      () => UpdateGeneralInfoCubit(getIt<ApiService>()));

  // Restore Recycle Bin
  getIt.registerLazySingleton<RestoreCubit>(
      () => RestoreCubit(getIt<ApiService>()));
}
