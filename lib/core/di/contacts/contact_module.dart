import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/contacts/create-contacts/logic/cubit/create_contact_cubit.dart';

import '../../../features/contacts/contact-view/Attatchments/delete_attachment/logic/cubit/delete_attachment_contact_cubit.dart';
import '../../../features/contacts/contact-view/contact-view/logic/cubit/contact_view_cubit.dart';
import '../../../features/contacts/contact-view/convert-to-client/logic/cubit/convert_to_client_cubit.dart';
import '../../../features/contacts/contact-view/delete-contact/logic/cubit/delete_contact_cubit.dart';
import '../../../features/contacts/contact-view/notes/create-note/logic/cubit/create_note_contact_cubit.dart';
import '../../../features/contacts/contact-view/notes/delete-note/logic/cubit/delete_note_contact_cubit.dart';
import '../../../features/contacts/contact-view/notes/edit-note/logic/cubit/edit_note_contact_cubit.dart';
import '../setup-di/dependency_injection.dart';

void setupContactModule() {
  // Create Contact instance
  getIt.registerLazySingleton<CreateContactCubit>(
      () => CreateContactCubit(getIt<ApiService>()));

  // Contact View instance
  getIt.registerLazySingleton<ContactViewCubit>(
      () => ContactViewCubit(getIt<ApiService>()));

  // Create Note Contact instance
  getIt.registerLazySingleton<CreateNoteContactCubit>(
      () => CreateNoteContactCubit(getIt<ApiService>()));

  // Edit Note Contact instance
  getIt.registerLazySingleton<EditNoteContactCubit>(
      () => EditNoteContactCubit(getIt<ApiService>()));

  // Delete Note Contact instance
  getIt.registerLazySingleton<DeleteNoteContactCubit>(
      () => DeleteNoteContactCubit(getIt<ApiService>()));

  // Delete Attachment Contact instance
  getIt.registerLazySingleton<DeleteAttachmentContactCubit>(
      () => DeleteAttachmentContactCubit(getIt<ApiService>()));

  // Convert Contact to Client instance
  getIt.registerLazySingleton<ConvertToClientCubit>(
      () => ConvertToClientCubit(getIt<ApiService>()));

  // Delete Contact instance
  getIt.registerLazySingleton<DeleteContactCubit>(
      () => DeleteContactCubit(getIt<ApiService>()));
}
