import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class CreateCampaignLeadCubit extends BaseCubit<FeatStatusModel> {
  CreateCampaignLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createCampaignLead(
              params!['id'],
              {
                'status': requestBody['status'],
                'lead_id': requestBody['lead_id']
              },
            ),
          ),
        );
  Future<void> createCampaignLead(
    String status,
    int campaignId,
    int leadId,
  ) async {
    await sendData(
      {'status': status, 'lead_id': leadId},
      params: {'id': campaignId},
    );
  }
}
