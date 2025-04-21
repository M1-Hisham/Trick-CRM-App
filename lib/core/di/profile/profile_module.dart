import 'package:trick_crm_app/features/profile/Company/update-company/logic/cubit/update_company_cubit.dart';

import '../../api/api_service.dart';
import '../setup-di/dependency_injection.dart';

void setupProfileModule() {
  // Update Company
  getIt.registerLazySingleton<UpdateCompanyCubit>(
      () => UpdateCompanyCubit(getIt<ApiService>()));
}
