import 'dart:convert';

import 'package:trick_crm_app/core/api/api_service.dart';

class ApiHelper {
  final ApiService apiService;

  ApiHelper(this.apiService);

  Future<T> getProjectReport<T>(
    String reportName,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await apiService.getProjectReportRaw(reportName);
    final Map<String, dynamic> jsonMap = json.decode(response.data);
    return fromJson(jsonMap);
  }
}