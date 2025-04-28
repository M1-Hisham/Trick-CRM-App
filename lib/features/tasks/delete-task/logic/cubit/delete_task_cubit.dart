import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class DeleteTaskCubit extends BaseCubit<FeatStatusModel> {
  DeleteTaskCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.deleteTask(params!["taskId"]),
          ),
        );

  Future<void> deleteTask(int taskId) async {
    await sendData(
      {},
      params: {"taskId": taskId},
    );
  }
}
