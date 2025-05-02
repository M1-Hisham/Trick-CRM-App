import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class CreateNoteDealCubit extends BaseCubit<FeatStatusModel> {
  CreateNoteDealCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createDealNote(params!['id'], requestBody),
          ),
        );
  Future<void> createDealNote(
    CreateAndEditNoteRequestBody createdealNoteModel,
    int dealId,
  ) async {
    await sendData(createdealNoteModel, params: {'id': dealId});
  }
}
