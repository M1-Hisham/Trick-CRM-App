import '../../../../core/api/api_service.dart';
import '../../../../core/cubits/base_cubit.dart';
import '../../../../core/repo/base_repo.dart';
import '../../model/campaigns_model.dart';

class CampaignsCubit extends BaseCubit<CampaignsModel> {
  CampaignsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getCampaigns(),
          ),
        );
}
