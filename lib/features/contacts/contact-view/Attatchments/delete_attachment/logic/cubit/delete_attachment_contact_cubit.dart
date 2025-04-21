import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentContactCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentContactCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteContactAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteContactAttachment(int contactId, int idAttachment) async {
    await getData(
      params: {'id': contactId, 'idAttachment': idAttachment},
    );
  }
}
