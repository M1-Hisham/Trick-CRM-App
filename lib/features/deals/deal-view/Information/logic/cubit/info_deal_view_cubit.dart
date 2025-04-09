import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/deals/deal-view/deal-view/data/model/deal_view_model.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoDealViewCubit extends BaseCubit<DealViewModel> {
  InfoDealViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getDealView(params!['id']),
          ),
        );
  Future<void> getInformationView(int dealId) async {
    await getData(params: {'id': dealId});
  }
}
