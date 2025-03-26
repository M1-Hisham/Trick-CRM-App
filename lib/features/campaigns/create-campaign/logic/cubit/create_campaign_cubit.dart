import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/create_campaign_model.dart';
import '../../data/model/create_campaign_request_body.dart';

class CreateCampaignCubit extends BaseCubit<CreateCampaignModel> {
  CreateCampaignCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createCampaign(requestBody)));

  Future<void> createCampaign(
      CreateCampaignRequestBody createCampaignRequestBody) async {
    await sendData(createCampaignRequestBody);
  }
}
