import 'package:trick_crm_app/features/profile/Subscription/data/model/subscription_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class SubscriptionCubit extends BaseCubit<SubscriptionModel> {
  SubscriptionCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getSubscription(),
          ),
        );
}
