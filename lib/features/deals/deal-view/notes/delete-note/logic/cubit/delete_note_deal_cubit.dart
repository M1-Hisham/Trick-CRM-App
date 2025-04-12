import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteDealCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteDealCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteDealNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteDealNote(int dealId, int noteId) async {
    await getData(
      params: {'id': dealId, 'idNote': noteId},
    );
  }
}
