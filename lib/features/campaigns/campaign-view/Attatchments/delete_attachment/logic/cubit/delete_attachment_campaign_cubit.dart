import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentCampaignCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteCampaignAttachment(
                    params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteCampaignAttachment(
      int campaignId, int idAttachment) async {
    await getData(
      params: {'id': campaignId, 'idAttachment': idAttachment},
    );
  }
}
