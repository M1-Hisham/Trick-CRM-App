import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/calls/call-view/call-view/data/model/call_view_model.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoCallViewCubit extends BaseCubit<CallViewModel> {
  InfoCallViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getCallView(params!['id']),
          ),
        );
  Future<void> getInformationView(int callId) async {
    await getData(params: {'id': callId});
  }
}
