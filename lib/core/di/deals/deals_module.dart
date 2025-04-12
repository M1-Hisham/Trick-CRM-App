import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/deals/create-deal/logic/cubit/create_deal_cubit.dart';

import '../../../features/deals/deal-view/deal-view/deal-view/logic/cubit/deal_view_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupDealsModule() {
  // Create Deal instance
  getIt.registerLazySingleton<CreateDealCubit>(
      () => CreateDealCubit(getIt<ApiService>()));

  // Information Deal View instance
  getIt.registerLazySingleton<DealViewCubit>(
      () => DealViewCubit(getIt<ApiService>()));
}
