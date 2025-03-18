import 'package:trick_crm_app/features/projects/payment-plans/data/model/payment_plans_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class PaymentPlansCubit extends BaseCubit<PaymentPlansModel> {
  PaymentPlansCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getPaymentPlans(),
          ),
        );
}
