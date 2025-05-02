import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteMeetingCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteMeetingCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteMeetingNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteMeetingNote(int meetingId, int noteId) async {
    await getData(
      params: {'id': meetingId, 'idNote': noteId},
    );
  }
}
