import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/create_contact_model.dart';
import '../../data/model/create_contact_request_body.dart';

class CreateContactCubit extends BaseCubit<CreateContactModel> {
  CreateContactCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createContact(requestBody)));

  Future<void> createContact(
      CreateContactRequestBody createContactRequestBody) async {
    await sendData(createContactRequestBody);
  }
}
