import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/leads/lead-view/notes/create-note/data/model/create_lead_note_model.dart';

import '../../data/model/create_lead_note_reqest_body.dart';

class CreateNoteCubit extends BaseCubit<CreateLeadNoteModel> {
  CreateNoteCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createLeadNote(params!['id'], requestBody),
          ),
        );
  Future<void> createLeadNote(
    CreateLeadNoteRequestBody createLeadNoteModel,
    int leadId,
  ) async {
    await sendData(createLeadNoteModel, params: {'id': leadId});
  }
}
