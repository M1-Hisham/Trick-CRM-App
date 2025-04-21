import 'package:trick_crm_app/core/api/api_service.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/call_view_model.dart';

class CallViewCubit extends BaseCubit<CallViewModel> {
  CallViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getCallView(params!['id']),
          ),
        );
  Future<void> getCallView(int callId) async {
    await getData(params: {'id': callId});
  }
}
