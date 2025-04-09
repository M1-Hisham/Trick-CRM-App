import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/meetings/create-meeting/logic/cubit/create_meeting_cubit.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/Information/logic/cubit/info_meeting_view_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupMeetingsModule() {
  // Create Meeting instance
  getIt.registerLazySingleton<CreateMeetingCubit>(
      () => CreateMeetingCubit(getIt<ApiService>()));

  // Information Meeting View instance
  getIt.registerLazySingleton<InfoMeetingViewCubit>(
      () => InfoMeetingViewCubit(getIt<ApiService>()));
}
