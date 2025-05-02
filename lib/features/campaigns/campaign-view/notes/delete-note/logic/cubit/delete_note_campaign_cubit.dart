import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteCampaignCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteCampaignNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteCampaignNote(int campaignId, int noteId) async {
    await getData(
      params: {'id': campaignId, 'idNote': noteId},
    );
  }
}
