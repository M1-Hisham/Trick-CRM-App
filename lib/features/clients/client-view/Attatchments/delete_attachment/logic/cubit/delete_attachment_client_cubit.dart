import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentClientCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentClientCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteClientAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteClientAttachment(int clientId, int idAttachment) async {
    await getData(
      params: {'id': clientId, 'idAttachment': idAttachment},
    );
  }
}
