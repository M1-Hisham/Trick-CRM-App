import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentCallCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentCallCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteCallAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteCallAttachment(int callId, int idAttachment) async {
    await getData(
      params: {'id': callId, 'idAttachment': idAttachment},
    );
  }
}
