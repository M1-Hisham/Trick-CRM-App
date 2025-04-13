import 'package:trick_crm_app/core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/broker_view_model.dart';

class BrokerViewCubit extends BaseCubit<BrokerViewModel> {
  BrokerViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getBrokerView(params!['id']),
          ),
        );
  Future<void> getBrokerView(int brokerId) async {
    await getData(params: {'id': brokerId});
  }
}
