import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentLeadCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentLeadCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteLeadAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteLeadAttachment(int leadId, int idAttachment) async {
    await getData(
      params: {'id': leadId, 'idAttachment': idAttachment},
    );
  }
}
