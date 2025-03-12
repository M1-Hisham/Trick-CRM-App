
import '../../../../core/api/api_service.dart';
import '../../../../core/cubits/base_cubit.dart';
import '../../../../core/repo/base_repo.dart';
import '../../data/model/calls_model.dart';

class CallsCubit extends BaseCubit<CallsModel> {
  CallsCubit(ApiService apiService)
      : super(
          BaseRepo(
            fetchData: ({params}) => apiService.getCalls(),
          ),
        );
}
