import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class EditNoteMeetingCubit extends BaseCubit<FeatStatusModel> {
  EditNoteMeetingCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (editNoteRequestBody, {Map<String, dynamic>? params}) =>
                apiService.editMeetingNote(
                    params!['id'], params['idNote'], editNoteRequestBody),
          ),
        );
  Future<void> editMeetingNote(int meetingId, int noteId,
      CreateAndEditNoteRequestBody editNoteRequestBody) async {
    await sendData(
      editNoteRequestBody,
      params: {'id': meetingId, 'idNote': noteId},
    );
  }
}
