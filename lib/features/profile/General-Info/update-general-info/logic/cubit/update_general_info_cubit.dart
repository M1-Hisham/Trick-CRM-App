import 'package:trick_crm_app/core/models/feat_status_model.dart';
import 'package:trick_crm_app/features/profile/General-Info/update-general-info/data/model/update_general_info_req_body.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class UpdateGeneralInfoCubit extends BaseCubit<FeatStatusModel> {
  UpdateGeneralInfoCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.updateUserInfo(requestBody)));

  Future<void> updateUserInfo(
      UpdateGeneralInfoReqBody updateGeneralInfoRequestBody) async {
    await sendData(updateGeneralInfoRequestBody);
  }
}
