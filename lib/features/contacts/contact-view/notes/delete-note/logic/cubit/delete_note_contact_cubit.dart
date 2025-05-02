import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteContactCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteContactCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteContactNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteContactNote(int contactId, int noteId) async {
    await getData(
      params: {'id': contactId, 'idNote': noteId},
    );
  }
}
