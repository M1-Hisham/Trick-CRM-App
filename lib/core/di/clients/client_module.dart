import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/clients/create-client/logic/cubit/create_client_cubit.dart';

import '../../../features/clients/client-view/client-view/logic/cubit/client_view_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupClientModule() {
  // Create Client instance
  getIt.registerLazySingleton<CreateClientCubit>(
      () => CreateClientCubit(getIt<ApiService>()));

  // Client View instance
  getIt.registerLazySingleton<ClientViewCubit>(
      () => ClientViewCubit(getIt<ApiService>()));
}
