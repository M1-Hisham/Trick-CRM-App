import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-tasks/create-lead-task/data/model/create_lead_task_request_body.dart';

class CreateLeadTaskCubit extends BaseCubit<CreateLeadTaskModel> {
  CreateLeadTaskCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) {
              return apiService.createLeadTask(
                params!['leadId'],
                requestBody,
              );
            },
          ),
        );

  Future<void> createLeadTask(
    int leadId,
    CreateLeadTaskRequestBody createLeadTaskRequestBody,
  ) async {
    await sendData(createLeadTaskRequestBody, params: {'leadId': leadId});
  }
}
