import 'package:trick_crm_app/core/api/api_service.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/deal_view_model.dart';

class DealViewCubit extends BaseCubit<DealViewModel> {
  DealViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getDealView(params!['id']),
          ),
        );
  Future<void> getDealView(int dealId) async {
    await getData(params: {'id': dealId});
  }
}
