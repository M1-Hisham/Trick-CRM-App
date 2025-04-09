import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/calls/call-view/Information/logic/cubit/info_call_view_cubit.dart';
import 'package:trick_crm_app/features/calls/create-call/logic/cubit/create_call_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupCallsModule() {
  // Create Calls instance
  getIt.registerLazySingleton<CreateCallCubit>(
      () => CreateCallCubit(getIt<ApiService>()));

  // Information Call View instance
  getIt.registerLazySingleton<InfoCallViewCubit>(
      () => InfoCallViewCubit(getIt<ApiService>()));
}
