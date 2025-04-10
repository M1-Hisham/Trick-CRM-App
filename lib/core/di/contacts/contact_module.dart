import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/contacts/contact-view/Information/logic/cubit/info_contact_view_cubit.dart';
import 'package:trick_crm_app/features/contacts/create-contacts/logic/cubit/create_contact_cubit.dart';

import '../../../features/contacts/contact-view/notes/create-note/logic/cubit/create_note_contact_cubit.dart';
import '../../../features/contacts/contact-view/notes/notes-view/logic/cubit/notes_contact_view_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupContactModule() {
  // Create Contact instance
  getIt.registerLazySingleton<CreateContactCubit>(
      () => CreateContactCubit(getIt<ApiService>()));

  // Information Contact View instance
  getIt.registerLazySingleton<InfoContactViewCubit>(
      () => InfoContactViewCubit(getIt<ApiService>()));

  // Notes Contact View instance
  getIt.registerLazySingleton<NotesContactViewCubit>(
      () => NotesContactViewCubit(getIt<ApiService>()));

  // Create Note Contact instance
  getIt.registerLazySingleton<CreateNoteContactCubit>(
      () => CreateNoteContactCubit(getIt<ApiService>()));
}
