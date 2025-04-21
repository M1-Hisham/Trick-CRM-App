import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/meetings/create-meeting/logic/cubit/create_meeting_cubit.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/meeting-view/logic/cubit/meeting_view_cubit.dart';

import '../../../features/meetings/meeting-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_meeting_cubit.dart';
import '../../../features/meetings/meeting-view/notes/create-note/logic/cubit/create_note_meeting_cubit.dart';
import '../../../features/meetings/meeting-view/notes/delete-note/logic/cubit/delete_note_meeting_cubit.dart';
import '../../../features/meetings/meeting-view/notes/edit-note/logic/cubit/edit_note_meeting_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupMeetingsModule() {
  // Create Meeting instance
  getIt.registerLazySingleton<CreateMeetingCubit>(
      () => CreateMeetingCubit(getIt<ApiService>()));

  // Meeting View instance
  getIt.registerLazySingleton<MeetingViewCubit>(
      () => MeetingViewCubit(getIt<ApiService>()));

  // Delete Note Meeting instance
  getIt.registerLazySingleton<DeleteNoteMeetingCubit>(
      () => DeleteNoteMeetingCubit(getIt<ApiService>()));

  // Create Note Meeting instance
  getIt.registerLazySingleton<CreateNoteMeetingCubit>(
      () => CreateNoteMeetingCubit(getIt<ApiService>()));

  // Edit Note Meeting instance
  getIt.registerLazySingleton<EditNoteMeetingCubit>(
      () => EditNoteMeetingCubit(getIt<ApiService>()));

  // Delete Attachment Meeting instance
  getIt.registerLazySingleton<DeleteAttachmentMeetingCubit>(
      () => DeleteAttachmentMeetingCubit(getIt<ApiService>()));
}
