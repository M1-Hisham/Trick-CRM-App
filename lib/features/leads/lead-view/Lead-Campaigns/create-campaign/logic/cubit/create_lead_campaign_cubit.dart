import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class CreateLeadCampaignCubit extends BaseCubit<FeatStatusModel> {
  CreateLeadCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createLeadCampaign(
              params!['id'],
              {
                'status': requestBody['status'],
                'campaign_id': requestBody['campaign_id']
              },
            ),
          ),
        );
  Future<void> createLeadCampaign(
      String status, int campaignId, int leadId) async {
    await sendData(
      {'status': status, 'campaign_id': campaignId},
      params: {'id': leadId},
    );
  }
}
