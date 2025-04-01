import 'package:trick_crm_app/features/clients/create-client/data/model/create_client_model.dart';
import 'package:trick_crm_app/features/clients/create-client/data/model/create_client_request_body.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class CreateClientCubit extends BaseCubit<CreateClientModel> {
  CreateClientCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createClient(requestBody)));

  Future<void> createClient(
      CreateClientRequestBody createClientRequestBody) async {
    await sendData(createClientRequestBody);
  }
}
