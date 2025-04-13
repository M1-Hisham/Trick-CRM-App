import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../core/models/note/create_and_edit_note_request_body.dart';

class CreateNoteCampaignCubit extends BaseCubit<FeatStatusModel> {
  CreateNoteCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createCampaignNote(params!['id'], requestBody),
          ),
        );
  Future<void> createCampaignNote(
    CreateAndEditNoteRequestBody createcampaignNoteModel,
    int campaignId,
  ) async {
    await sendData(createcampaignNoteModel, params: {'id': campaignId});
  }
}
