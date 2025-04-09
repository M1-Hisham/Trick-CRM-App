import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/projects/payment-plans/create-payment-plans/logic/cubit/create_payment_plans_cubit.dart';

import '../setup-di/dependency_injection.dart';

void setupPaymentPlansModule() {
  // Create Payment Plans instance
  getIt.registerLazySingleton<CreatePaymentPlansCubit>(
      () => CreatePaymentPlansCubit(getIt<ApiService>()));
}
