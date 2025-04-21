
import 'package:trick_crm_app/features/projects/payment-plans/create-payment-plans/data/model/create_payment_plans_request_body.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/create_payment_plans_model.dart';

class CreatePaymentPlansCubit extends BaseCubit<CreatePaymentPlansModel> {
  CreatePaymentPlansCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createPaymentPlans(requestBody)));

  Future<void> createPaymentPlan(CreatePaymentPlansRequestBody createPaymentPlansRequestBody) async {
    await sendData(createPaymentPlansRequestBody);
  }
}
