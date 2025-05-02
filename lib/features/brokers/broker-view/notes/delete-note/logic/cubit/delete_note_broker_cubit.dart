import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteNoteBrokerCubit extends BaseCubit<FeatStatusModel> {
  DeleteNoteBrokerCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.deleteBrokerNote(params!['id'], params['idNote']),
          ),
        );
  Future<void> deleteBrokerNote(int brokerId, int noteId) async {
    await getData(
      params: {'id': brokerId, 'idNote': noteId},
    );
  }
}
