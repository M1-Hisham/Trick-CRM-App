import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/edit_note_request_body.dart';

class EditNoteContactCubit extends BaseCubit<FeatStatusModel> {
  EditNoteContactCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (editNoteRequestBody, {Map<String, dynamic>? params}) =>
                apiService.editContactNote(
                    params!['id'], params['idNote'], editNoteRequestBody),
          ),
        );
  Future<void> editContactNote(int contactId, int noteId,
      EditNoteRequestBody editNoteRequestBody) async {
    await sendData(
      editNoteRequestBody,
      params: {'id': contactId, 'idNote': noteId},
    );
  }
}
