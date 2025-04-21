import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/update_company_request_body.dart';

class UpdateCompanyCubit extends BaseCubit<FeatStatusModel> {
  UpdateCompanyCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.updateCompany(requestBody)));

  Future<void> updateCompany(
      UpdateCompanyRequestBody updateCompanyRequestBody) async {
    await sendData(updateCompanyRequestBody);
  }
}
