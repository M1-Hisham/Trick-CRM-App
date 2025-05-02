import 'package:trick_crm_app/features/profile/Recycle-Bin/recycle-bin-view/data/model/recycle_bin_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class RecycleBinCubit extends BaseCubit<RecycleBinModel> {
  RecycleBinCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getRecycleBin(),
          ),
        );
}
