import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/brokers/broker-view/Information/logic/cubit/info_broker_view_cubit.dart';
import 'package:trick_crm_app/features/brokers/create-broker/logic/cubit/create_broker_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupBrokersModule() {
  // Create Broker instance
  getIt.registerLazySingleton<CreateBrokerCubit>(
      () => CreateBrokerCubit(getIt<ApiService>()));

  // Information Broker instance
  getIt.registerLazySingleton<InfoBrokerViewCubit>(
      () => InfoBrokerViewCubit(getIt<ApiService>()));
}
