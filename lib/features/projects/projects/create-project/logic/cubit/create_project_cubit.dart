import 'package:trick_crm_app/features/projects/projects/create-project/data/model/create_project_request_body.dart';

import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/create_project_model.dart';

class CreateProjectCubit extends BaseCubit<CreateProjectModel> {
  CreateProjectCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createProject(requestBody)));

  Future<void> createProject(
      CreateProjectRequestBody createProjectRequestBody) async {
    await sendData(createProjectRequestBody);
  }
}
