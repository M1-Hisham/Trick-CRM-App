import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/create_call_model.dart';
import '../../data/model/create_call_request_body.dart';

class CreateCallCubit extends BaseCubit<CreateCallModel> {
  CreateCallCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createCall(requestBody)));

  Future<void> createCall(CreateCallRequestBody createCallRequestBody) async {
    await sendData(createCallRequestBody);
  }
}
