import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/leads/lead-view/Campaigns/create-campaigns/data/model/campaign_leads_request_body.dart';
import 'package:trick_crm_app/features/leads/lead-view/Campaigns/create-campaigns/data/model/create_campaign_leads_model.dart';

class CreateCampaignLeadCubit extends BaseCubit<CreateCampaignLeadsModel> {
  CreateCampaignLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createLeadCampaign(params!['id'], requestBody),
          ),
        );
  Future<void> createLeadCampaign(
    CampaignLeadsRequestBody createLeadCampaign,
    int leadId,
  ) async {
    await sendData(createLeadCampaign, params: {'id': leadId});
  }
}
