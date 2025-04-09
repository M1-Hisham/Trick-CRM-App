import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/clients/client-view/Information/logic/cubit/info_client_view_cubit.dart';
import 'package:trick_crm_app/features/clients/create-client/logic/cubit/create_client_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupClientModule() {
  // Create Client instance
  getIt.registerLazySingleton<CreateClientCubit>(
      () => CreateClientCubit(getIt<ApiService>()));

  // Information Client View instance
  getIt.registerLazySingleton<InfoClientViewCubit>(
      () => InfoClientViewCubit(getIt<ApiService>()));
}
