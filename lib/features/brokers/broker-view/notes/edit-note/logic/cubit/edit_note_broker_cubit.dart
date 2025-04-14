import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class EditNoteBrokerCubit extends BaseCubit<FeatStatusModel> {
  EditNoteBrokerCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (editNoteRequestBody, {Map<String, dynamic>? params}) =>
                apiService.editBrokerNote(
                    params!['id'], params['idNote'], editNoteRequestBody),
          ),
        );
  Future<void> editBrokerNote(int brokerId, int noteId,
      CreateAndEditNoteRequestBody editNoteRequestBody) async {
    await sendData(
      editNoteRequestBody,
      params: {'id': brokerId, 'idNote': noteId},
    );
  }
}
