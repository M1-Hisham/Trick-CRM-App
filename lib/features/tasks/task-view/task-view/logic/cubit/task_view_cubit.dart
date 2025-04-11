import 'package:trick_crm_app/core/api/api_service.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';
import '../../data/model/task_view_model.dart';

class TaskViewCubit extends BaseCubit<TaskViewModel> {
  TaskViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getTaskView(params!['id']),
          ),
        );
  Future<void> getTaskView(int taskId) async {
    await getData(params: {'id': taskId});
  }
}
