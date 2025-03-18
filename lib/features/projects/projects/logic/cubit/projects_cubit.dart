import 'package:trick_crm_app/features/projects/projects/data/model/projects_model.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class ProjectsCubit extends BaseCubit<ProjectsModel> {
  ProjectsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getProjects(),
          ),
        );
}
