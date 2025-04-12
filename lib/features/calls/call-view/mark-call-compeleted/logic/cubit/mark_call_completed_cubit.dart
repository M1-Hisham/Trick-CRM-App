import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class MarkCallCompletedCubit extends BaseCubit<FeatStatusModel> {
  MarkCallCompletedCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.markCallAsComplete(params?['id']),
          ),
        );
  Future<void> markCallAsComplete(int callId) async {
    await getData(params: {'id': callId});
  }
}
