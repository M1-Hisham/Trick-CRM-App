import 'package:trick_crm_app/features/profile/General-Info/general-info-view/data/model/general_info_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class GeneralInfoCubit extends BaseCubit<GeneralInfoModel> {
  GeneralInfoCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getUserProfile(params!['id']),
          ),
        );
  Future<void> getUserProfile(int userId) async {
    await getData(params: {'id': userId});
  }
}
