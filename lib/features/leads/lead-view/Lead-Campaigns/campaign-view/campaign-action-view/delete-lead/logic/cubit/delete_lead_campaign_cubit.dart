import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteLeadCampaignCubit extends BaseCubit<FeatStatusModel> {
  DeleteLeadCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteLeadCampaign(
              params!['leadId'],
              params['campaignId'],
            ),
          ),
        );
  Future<void> deleteLeadCampaign(
    int leadId,
    int campaignId,
  ) async {
    await getData(
      params: {'leadId': leadId, 'campaignId': campaignId},
    );
  }
}
