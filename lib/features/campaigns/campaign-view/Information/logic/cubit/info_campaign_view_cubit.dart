import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/campaign-view/data/model/campaign_view_model.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoCampaignViewCubit extends BaseCubit<CampaignViewModel> {
  InfoCampaignViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getCampaignView(params!['id']),
          ),
        );
  Future<void> getInformationView(int campaignId) async {
    await getData(params: {'id': campaignId});
  }
}
