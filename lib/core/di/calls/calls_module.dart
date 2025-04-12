import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/calls/create-call/logic/cubit/create_call_cubit.dart';

import '../../../features/calls/call-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_call_cubit.dart';
import '../../../features/calls/call-view/call-view/logic/cubit/call_view_cubit.dart';
import '../../../features/calls/call-view/mark-call-compeleted/logic/cubit/mark_call_completed_cubit.dart';
import '../../../features/calls/call-view/notes/create-note/logic/cubit/create_note_call_cubit.dart';
import '../../../features/calls/call-view/notes/delete-note/logic/cubit/delete_note_call_cubit.dart';
import '../../../features/calls/call-view/notes/edit-note/logic/cubit/edit_note_call_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupCallsModule() {
  // Create Calls instance
  getIt.registerLazySingleton<CreateCallCubit>(
      () => CreateCallCubit(getIt<ApiService>()));

  // Call View instance
  getIt.registerLazySingleton<CallViewCubit>(
      () => CallViewCubit(getIt<ApiService>()));

  // Create Note Call instance
  getIt.registerLazySingleton<CreateNoteCallCubit>(
      () => CreateNoteCallCubit(getIt<ApiService>()));

  // Delete Note Call instance
  getIt.registerLazySingleton<DeleteNoteCallCubit>(
      () => DeleteNoteCallCubit(getIt<ApiService>()));

  // Edit Note Call instance
  getIt.registerLazySingleton<EditNoteCallCubit>(
      () => EditNoteCallCubit(getIt<ApiService>()));

  // Delete Attachment Call instance
  getIt.registerLazySingleton<DeleteAttachmentCallCubit>(
      () => DeleteAttachmentCallCubit(getIt<ApiService>()));

  // Mark Call Completed instance
  getIt.registerLazySingleton<MarkCallCompletedCubit>(
      () => MarkCallCompletedCubit(getIt<ApiService>()));
}
