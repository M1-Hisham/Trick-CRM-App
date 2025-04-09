import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/brokers/broker-view/broker-view/data/model/broker_view_model.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoBrokerViewCubit extends BaseCubit<BrokerViewModel> {
  InfoBrokerViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getBrokerView(params!['id']),
          ),
        );
  Future<void> getInformationView(int brokerId) async {
    await getData(params: {'id': brokerId});
  }
}
