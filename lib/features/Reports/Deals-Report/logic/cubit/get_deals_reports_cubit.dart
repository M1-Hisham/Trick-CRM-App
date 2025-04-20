import '../../../../../core/api/api_service.dart';
import '../../../../../core/cubits/base_cubit.dart';
import '../../../../../core/helpers/api_helper.dart';
import '../../../../../core/repo/base_repo.dart';
import 'dart:convert';

class GetDealsReportsCubit<T> extends BaseCubit<T> {
  final T Function(Map<String, dynamic>) fromJson;

  GetDealsReportsCubit({
    required ApiService apiService,
    required this.fromJson,
  }) : super(
          BaseRepo(
            fetchData: ({Map<String, dynamic>? params}) async => ApiHelper(
              apiService,
              json.decode(
                await apiService
                    .getDealReportRaw(params!['reportName'])
                    .then((response) => response.data),
              ),
            ).getFeatReport<T>(
              params['reportName'],
              fromJson,
            ),
          ),
        );

  Future<void> getDealReport(String reportName) async {
    await getData(params: {'reportName': reportName});
  }
}
