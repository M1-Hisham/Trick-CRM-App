import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteCampaignLeadCubit extends BaseCubit<FeatStatusModel> {
  DeleteCampaignLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteCampaignLead(
              params!['campaignId'],
              params['leadId'],
            ),
          ),
        );
  Future<void> deleteCampaignLead(
    int campaignId,
    int leadId,
  ) async {
    await getData(
      params: {'campaignId': campaignId, 'leadId': leadId},
    );
  }
}
