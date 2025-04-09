import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';
import 'package:trick_crm_app/features/meetings/meeting-view/meeting-view/data/model/meeting_view_model.dart';

class InfoMeetingViewCubit extends BaseCubit<MeetingViewModel> {
  InfoMeetingViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getMeetingView(params!['id']),
          ),
        );
  Future<void> getInformationView(int meetingId) async {
    await getData(params: {'id': meetingId});
  }
}
