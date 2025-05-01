import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class DeleteMeetingCubit extends BaseCubit<FeatStatusModel> {
  DeleteMeetingCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.deleteMeeting(params!["meetingId"]),
          ),
        );

  Future<void> deleteMeeting(int meetingId) async {
    await sendData(
      {},
      params: {"meetingId": meetingId},
    );
  }
}
