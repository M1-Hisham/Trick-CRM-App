import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class EditLeadCampaignCubit extends BaseCubit<FeatStatusModel> {
  EditLeadCampaignCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.editLeadCampaign(
              params!['leadId'],
              params['campaignId'],
              {'status': requestBody['status']},
            ),
          ),
        );
  Future<void> editLeadCampaign(
    String status,
    int leadId,
    int campaignId,
  ) async {
    await sendData(
      {'status': status},
      params: {'leadId': leadId, 'campaignId': campaignId},
    );
  }
}
