import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentDealCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentDealCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteDealAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteDealAttachment(int dealId, int idAttachment) async {
    await getData(
      params: {'id': dealId, 'idAttachment': idAttachment},
    );
  }
}
