import 'package:trick_crm_app/core/helpers/api_helper.dart';

import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/repo/base_repo.dart';

class GetProjectsReportsCubit<T> extends BaseCubit<T> {
  final T Function(Map<String, dynamic>) fromJson;

  GetProjectsReportsCubit({
    required ApiService apiService,
    required this.fromJson,
  }) : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) =>
                ApiHelper(apiService).getProjectReport<T>(
              params!['reportName'],
              fromJson,
            ),
          ),
        );

  Future<void> getProjectReport(String reportName) async {
    await getData(params: {'reportName': reportName});
  }
}
