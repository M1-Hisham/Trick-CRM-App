import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

import '../../../../../../../meetings/create-meeting/data/model/create_meeting_request_body.dart';

class CreateLeadMeetingCubit extends BaseCubit<FeatStatusModel> {
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
    CreateMeetingRequestBody requestBody,
    int leadId,
  ) async {
    await sendData(requestBody, params: {'id': leadId});
  }
}
