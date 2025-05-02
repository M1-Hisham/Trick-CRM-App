import 'package:trick_crm_app/core/api/api_service.dart';
import 'package:trick_crm_app/features/tasks/task-view/task-view/data/model/task_view_model.dart';

import '../../../../../../core/cubits/base_cubit.dart';
import '../../../../../../core/repo/base_repo.dart';

class InfoTaskViewCubit extends BaseCubit<TaskViewModel> {
  InfoTaskViewCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                apiService.getTaskView(params!['id']),
          ),
        );
  Future<void> getInformationView(int taskId) async {
    await getData(params: {'id': taskId});
  }
}
