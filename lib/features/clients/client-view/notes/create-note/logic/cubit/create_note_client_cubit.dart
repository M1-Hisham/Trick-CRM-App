import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class CreateNoteClientCubit extends BaseCubit<FeatStatusModel> {
  CreateNoteClientCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createClientNote(params!['id'], requestBody),
          ),
        );
  Future<void> createclientNote(
    CreateAndEditNoteRequestBody createClientNoteModel,
    int clientId,
  ) async {
    await sendData(createClientNoteModel, params: {'id': clientId});
  }
}
