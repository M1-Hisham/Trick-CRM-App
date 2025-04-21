import 'package:trick_crm_app/core/api/api_service.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/campaign_view_model.dart';

class CampaignViewCubit extends BaseCubit<CampaignViewModel> {
  CampaignViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getCampaignView(params!['id']),
          ),
        );
  Future<void> getCampaignView(int campaignId) async {
    await getData(params: {'id': campaignId});
  }
}
