import 'package:trick_crm_app/features/tasks/tasks/data/model/tasks_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class TasksCubit extends BaseCubit<TasksModel> {
  TasksCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getTasks(),
          ),
        );
}
