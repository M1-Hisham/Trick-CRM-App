import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class DeleteCallCubit extends BaseCubit<FeatStatusModel> {
  DeleteCallCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.callDelete(params!["callId"]),
          ),
        );

  Future<void> deletecall(int callId) async {
    await sendData(
      {},
      params: {"callId": callId},
    );
  }
}
