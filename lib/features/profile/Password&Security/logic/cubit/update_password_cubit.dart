import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class UpdatePasswordCubit extends BaseCubit<FeatStatusModel> {
  UpdatePasswordCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.updatePassword(requestBody),
          ),
        );

  Future<void> updatePassword(String  currentPassword,String updatePassword) async {
    await sendData(
      {
        "current_password": currentPassword,
        "password": updatePassword,
      },
    );
  }
}
