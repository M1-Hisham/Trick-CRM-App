import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/clients/create-client/logic/cubit/create_client_cubit.dart';

import '../../../features/clients/client-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_client_cubit.dart';
import '../../../features/clients/client-view/client-view/logic/cubit/client_view_cubit.dart';
import '../../../features/clients/client-view/notes/create-note/logic/cubit/create_note_client_cubit.dart';
import '../../../features/clients/client-view/notes/delete-note/logic/cubit/delete_note_client_cubit.dart';
import '../../../features/clients/client-view/notes/edit-note/logic/cubit/edit_note_client_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupClientModule() {
  // Create Client instance
  getIt.registerLazySingleton<CreateClientCubit>(
      () => CreateClientCubit(getIt<ApiService>()));

  // Client View instance
  getIt.registerLazySingleton<ClientViewCubit>(
      () => ClientViewCubit(getIt<ApiService>()));

  // Create Note Client instance
  getIt.registerLazySingleton<CreateNoteClientCubit>(
      () => CreateNoteClientCubit(getIt<ApiService>()));

  // Delete Note Client instance
  getIt.registerLazySingleton<DeleteNoteClientCubit>(
      () => DeleteNoteClientCubit(getIt<ApiService>()));

  // Edit Note Client instance
  getIt.registerLazySingleton<EditNoteClientCubit>(
      () => EditNoteClientCubit(getIt<ApiService>()));

  // Delete Attachment instance
  getIt.registerLazySingleton<DeleteAttachmentClientCubit>(
      () => DeleteAttachmentClientCubit(getIt<ApiService>()));
}
