import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/create_meeting_model.dart';
import '../../data/model/create_meeting_request_body.dart';

class CreateMeetingCubit extends BaseCubit<CreateMeetingModel> {
  CreateMeetingCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createMeeting(requestBody)));

  Future<void> createMeeting(
      CreateMeetingRequestBody createMeetingRequestBody) async {
    await sendData(createMeetingRequestBody);
  }
}
