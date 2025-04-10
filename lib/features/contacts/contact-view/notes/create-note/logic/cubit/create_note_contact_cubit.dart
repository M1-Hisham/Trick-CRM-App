import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/create-note/data/model/create_contact_note_model.dart';
import 'package:trick_crm_app/features/contacts/contact-view/notes/create-note/data/model/create_contact_note_request_body.dart';

class CreateNoteContactCubit extends BaseCubit<CreateContactNoteModel> {
  CreateNoteContactCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createContactNote(params!['id'], requestBody),
          ),
        );
  Future<void> createContactNote(
    CreateContactNoteRequestBody createContactNoteModel,
    int contactId,
  ) async {
    await sendData(createContactNoteModel, params: {'id': contactId});
  }
}
