import '../../../../../../../core/api/api_service.dart';
import '../../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../../core/repo/base_repo.dart';
import '../../data/model/create_broker_request_body.dart';
import '../../data/model/create_brokers_model.dart';

class CreateBrokerCubit extends BaseCubit<CreateBrokersModel> {
  CreateBrokerCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createBroker(requestBody)));

  Future<void> createBroker(
      CreateBrokerRequestBody createBrokerRequestBody) async {
    await sendData(createBrokerRequestBody);
  }
}
