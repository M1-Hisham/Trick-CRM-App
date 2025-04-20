import 'package:trick_crm_app/core/api/api_service.dart';

class ApiHelper {
  final ApiService apiService;
  final Map<String, dynamic> jsonMap;
  ApiHelper(this.apiService, this.jsonMap);

  Future<T> getFeatReport<T>(
    String reportName,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    // final response = await apiService.getDealReportRaw(reportName);
    // final Map<String, dynamic> jsonMap = json.decode(response.data);
    return fromJson(jsonMap);
  }
}
