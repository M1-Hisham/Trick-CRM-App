import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteLeadCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteLeadNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteLeadNote(int leadId, int noteId) async {
    await getData(
      params: {'id': leadId, 'idNote': noteId},
    );
  }
}
