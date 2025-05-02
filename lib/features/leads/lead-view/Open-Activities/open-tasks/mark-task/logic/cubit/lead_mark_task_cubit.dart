import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class LeadMarkTaskCubit extends BaseCubit<FeatStatusModel> {
  LeadMarkTaskCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) {
              return apiService.markLeadTaskAsCompleted(
                params!['leadId'],
                params['taskId'],
              );
            },
          ),
        );

  Future<void> markLeadTaskAsCompleted(
    int leadId,
    int taskId,
  ) async {
    await sendData({}, params: {'leadId': leadId, 'taskId': taskId});
  }
}
