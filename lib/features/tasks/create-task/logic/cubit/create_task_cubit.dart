import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/create_task_model.dart';
import '../../data/model/create_task_request_body.dart';

class CreateTaskCubit extends BaseCubit<CreateTaskModel> {
  CreateTaskCubit(ApiService apiService)
      : super(BaseRepo(
            sendData: (requestBody, {Map<String, dynamic>? params}) =>
                apiService.createTask(requestBody)));

  Future<void> createTask(CreateTaskRequestBody createTaskRequestBody) async {
    await sendData(createTaskRequestBody);
  }
}
