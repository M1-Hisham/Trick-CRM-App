import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteAttachmentBrokerCubit extends BaseCubit<FeatStatusModel> {
  DeleteAttachmentBrokerCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) => apiService
                .deleteBrokerAttachment(params!['id'], params['idAttachment']),
          ),
        );
  Future<void> deleteBrokerAttachment(int brokerId, int idAttachment) async {
    await getData(
      params: {'id': brokerId, 'idAttachment': idAttachment},
    );
  }
}
