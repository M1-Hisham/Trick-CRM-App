import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/brokers_model.dart';

class BrokersCubit extends BaseCubit<BrokersModel> {
  BrokersCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getBrokers(),
          ),
        );
}
