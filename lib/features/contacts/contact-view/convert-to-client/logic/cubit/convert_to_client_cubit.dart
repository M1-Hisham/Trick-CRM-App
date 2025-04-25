import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class ConvertToClientCubit extends BaseCubit<FeatStatusModel> {
  ConvertToClientCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.convertContactToClient(params!['id']),
          ),
        );
  Future<void> convertContactToClient(
    int contactId,
  ) async {
    await sendData({}, params: {'id': contactId});
  }
}
