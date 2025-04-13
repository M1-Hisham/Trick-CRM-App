import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class EditCampaignLeadCubit extends BaseCubit<FeatStatusModel> {
  EditCampaignLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.editCampaignLead(
              params!['campaignId'],
              params['leadId'],
              {'status': requestBody['status']},
            ),
          ),
        );
  Future<void> editCampaignLead(
    String status,
    int campaignId,
    int leadId,
  ) async {
    await sendData(
      {'status': status},
      params: {'campaignId': campaignId, 'leadId': leadId},
    );
  }
}
