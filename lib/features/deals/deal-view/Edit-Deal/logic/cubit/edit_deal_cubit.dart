import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../../../create-deal/data/model/create_deal_request_body.dart';

class EditDealCubit extends BaseCubit<FeatStatusModel> {
  EditDealCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.editDeal(params!['id'], requestBody),
          ),
        );

  Future<void> editDeal(
    int dealId,
    CreateDealRequestBody editDealRequestBody,
  ) async {
    await sendData(params: {'id': dealId}, editDealRequestBody);
  }
}
