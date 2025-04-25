import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/core/cubits/base_cubit.dart';
import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/core/repo/base_repo.dart';

class DeleteContactCubit extends BaseCubit<FeatStatusModel> {
  DeleteContactCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.deleteContact(params!['id']),
          ),
        );
  Future<void> deleteContact(
    int contactId,
  ) async {
    await sendData({}, params: {'id': contactId});
  }
}
