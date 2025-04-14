import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/brokers/create-broker/logic/cubit/create_broker_cubit.dart';

import '../../../features/brokers/broker-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_broker_cubit.dart';
import '../../../features/brokers/broker-view/broker-view/logic/cubit/broker_view_cubit.dart';
import '../../../features/brokers/broker-view/notes/create-note/logic/cubit/create_note_broker_cubit.dart';
import '../../../features/brokers/broker-view/notes/delete-note/logic/cubit/delete_note_broker_cubit.dart';
import '../../../features/brokers/broker-view/notes/edit-note/logic/cubit/edit_note_broker_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupBrokersModule() {
  // Create Broker instance
  getIt.registerLazySingleton<CreateBrokerCubit>(
      () => CreateBrokerCubit(getIt<ApiService>()));

  // Broker instance
  getIt.registerLazySingleton<BrokerViewCubit>(
      () => BrokerViewCubit(getIt<ApiService>()));

  // Create Note Broker instance
  getIt.registerLazySingleton<CreateNoteBrokerCubit>(
      () => CreateNoteBrokerCubit(getIt<ApiService>()));

  // Edit Note Broker instance
  getIt.registerLazySingleton<EditNoteBrokerCubit>(
      () => EditNoteBrokerCubit(getIt<ApiService>()));

  // Delete Note Broker instance
  getIt.registerLazySingleton<DeleteNoteBrokerCubit>(
      () => DeleteNoteBrokerCubit(getIt<ApiService>()));

  // Delete Attachment Broker instance
  getIt.registerLazySingleton<DeleteAttachmentBrokerCubit>(
      () => DeleteAttachmentBrokerCubit(getIt<ApiService>()));
}
