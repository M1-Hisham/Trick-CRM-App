import 'package:trick_crm_app/features/profile/Company/company-view/data/model/company_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class CompanyCubit extends BaseCubit<CompanyModel> {
  CompanyCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getCompany(),
          ),
        );
}
