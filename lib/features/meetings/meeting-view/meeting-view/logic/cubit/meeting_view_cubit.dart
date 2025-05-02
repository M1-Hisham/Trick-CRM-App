import 'package:trick_crm_app/core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/meeting_view_model.dart';

class MeetingViewCubit extends BaseCubit<MeetingViewModel> {
  MeetingViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getMeetingView(params!['id']),
          ),
        );
  Future<void> getMeetingView(int meetingId) async {
    await getData(params: {'id': meetingId});
  }
}
