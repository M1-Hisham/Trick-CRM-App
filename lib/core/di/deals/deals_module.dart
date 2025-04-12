import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/deals/create-deal/logic/cubit/create_deal_cubit.dart';

import '../../../features/deals/deal-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_deal_cubit.dart';
import '../../../features/deals/deal-view/deal-view/logic/cubit/deal_view_cubit.dart';
import '../../../features/deals/deal-view/notes/create-note/logic/cubit/create_note_deal_cubit.dart';
import '../../../features/deals/deal-view/notes/delete-note/logic/cubit/delete_note_deal_cubit.dart';
import '../../../features/deals/deal-view/notes/edit-note/logic/cubit/edit_note_deal_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupDealsModule() {
  // Create Deal instance
  getIt.registerLazySingleton<CreateDealCubit>(
      () => CreateDealCubit(getIt<ApiService>()));

  // Information Deal View instance
  getIt.registerLazySingleton<DealViewCubit>(
      () => DealViewCubit(getIt<ApiService>()));

  // Edit Note Deal instance
  getIt.registerLazySingleton<EditNoteDealCubit>(
      () => EditNoteDealCubit(getIt<ApiService>()));

  // Delete Note Deal instance
  getIt.registerLazySingleton<DeleteNoteDealCubit>(
      () => DeleteNoteDealCubit(getIt<ApiService>()));

  // Create Note Deal instance
  getIt.registerLazySingleton<CreateNoteDealCubit>(
      () => CreateNoteDealCubit(getIt<ApiService>()));

  // Delete Attachment Deal instance
  getIt.registerLazySingleton<DeleteAttachmentDealCubit>(
      () => DeleteAttachmentDealCubit(getIt<ApiService>()));
}
