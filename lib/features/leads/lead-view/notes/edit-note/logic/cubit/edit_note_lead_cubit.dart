import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class EditNoteLeadCubit extends BaseCubit<FeatStatusModel> {
  EditNoteLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (editNoteRequestBody, {Map<String, dynamic>? params}) =>
                apiService.editLeadNote(
                    params!['id'], params['idNote'], editNoteRequestBody),
          ),
        );
  Future<void> editLeadNote(int leadId, int noteId,
      CreateAndEditNoteRequestBody editNoteRequestBody) async {
    await sendData(
      editNoteRequestBody,
      params: {'id': leadId, 'idNote': noteId},
    );
  }
}
