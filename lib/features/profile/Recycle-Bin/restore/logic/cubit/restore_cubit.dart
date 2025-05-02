import 'package:trick_crm_app/core/models/feat_status_model.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class RestoreCubit extends BaseCubit<FeatStatusModel> {
  RestoreCubit(ApiService apiService)
      : super(
          BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.restoreRecycleBin(
              params!['recycleName'],
              params['id'],
            ),
          ),
        );

  Future<void> restoreRecycleBin(String recycleName, int id) async {
    await sendData(
      {},
      params: {'recycleName': recycleName, 'id': id},
    );
  }
}
