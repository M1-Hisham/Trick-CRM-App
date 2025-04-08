

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';
import '../../data/model/meetings_model.dart';

class MeetingsCubit extends BaseCubit<MeetingsModel> {
  MeetingsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getMeetings(),
          ),
        );
}
