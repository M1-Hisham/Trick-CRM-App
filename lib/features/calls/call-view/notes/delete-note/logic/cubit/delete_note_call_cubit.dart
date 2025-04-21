import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteCallCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteCallCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteCallNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteCallNote(int callId, int noteId) async {
    await getData(
      params: {'id': callId, 'idNote': noteId},
    );
  }
}
