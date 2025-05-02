import 'package:trick_crm_app/features/deals/deals/data/model/deals_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class DealsCubit extends BaseCubit<DealsModel> {
  DealsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getDeals(),
          ),
        );
}
