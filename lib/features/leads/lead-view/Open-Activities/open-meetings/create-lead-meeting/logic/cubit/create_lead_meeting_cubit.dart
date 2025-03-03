import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_model.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-meetings/create-lead-meeting/data/model/create_lead_meeting_request_body.dart';

class CreateLeadMeetingCubit extends BaseCubit<CreateLeadMeetingModel> {
  CreateLeadMeetingCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createLeadMeeting(
              params!['id'],
              requestBody,
            ),
          ),
        );
  Future<void> createLeadMeeting(
    CreateLeadMeetingRequestBody requestBody,
    int leadId,
  ) async {
    await sendData(requestBody, params: {'id': leadId});
  }
}
