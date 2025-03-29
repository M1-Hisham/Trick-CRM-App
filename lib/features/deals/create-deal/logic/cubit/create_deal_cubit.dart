import 'package:trick_crm_app/features/deals/create-deal/data/model/create_deal_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/create_deal_request_body.dart';

class CreateDealCubit extends BaseCubit<CreateDealModel> {
  CreateDealCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createDeal(requestBody)));

  Future<void> createDeal(CreateDealRequestBody createDealRequestBody) async {
    await sendData(createDealRequestBody);
  }
}
