import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class CloseDealCubit extends BaseCubit<FeatStatusModel> {
  CloseDealCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.closeDeal(params?['id']),
          ),
        );
  Future<void> closeDeal(int dealId) async {
    await getData(params: {'id': dealId});
  }
}
