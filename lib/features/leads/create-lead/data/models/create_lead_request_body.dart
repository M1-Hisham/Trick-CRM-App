import 'dart:io';

import 'package:json_annotation/json_annotation.dart';

part 'create_lead_request_body.g.dart';

@JsonSerializable()
class CreateLeadRequestBody {
  @JsonKey(
    fromJson: _fileFromJson,
    toJson: _fileToJson,
  )
  final File? image;
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'assigned_to_id')
  final int? assignedToId;
  @JsonKey(name: 'end_time')
  final String? endTime;
  @JsonKey(name: 'end_time_hour')
  final String? endTimeHour;
  @JsonKey(name: 'first_name')
  final String firstName;
  @JsonKey(name: 'last_name')
  final String lastName;
  final String email;
  @JsonKey(name: 'job_title')
  final String? jobTitle;
  final String mobile;
  @JsonKey(name: 'mobile_2')
  final String? mobile2;
  final String? company;
  final String? industry;
  final String? rating;
  @JsonKey(name: 'annual_revenue')
  final int? annualRevenue;
  final String? website;
  @JsonKey(name: 'lead_source')
  final String? leadSource;
  @JsonKey(name: 'lead_status')
  final String? leadStatus;
  @JsonKey(name: 'secondary_email')
  final String? secondaryEmail;
  final String? state;
  final String? country;
  final String? city;
  final String? description;
  CreateLeadRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    this.image,
    this.company,
    this.jobTitle,
    this.mobile2,
    this.website,
    this.rating,
    this.leadStatus,
    this.leadSource,
    this.annualRevenue,
    this.industry,
    this.country,
    this.city,
    this.state,
    this.description,
    this.assignedToId,
    this.endTime,
    this.endTimeHour,
    this.userId,
    this.secondaryEmail,
  });

  static File? _fileFromJson(String? path) {
    if (path == null) return null;
    return File(path);
  }

  static String? _fileToJson(File? file) {
    return file?.path;
  }

  Map<String, dynamic> toJson() => _$CreateLeadRequestBodyToJson(this);
  factory CreateLeadRequestBody.fromJson(Map<String, dynamic> json) =>
      _$CreateLeadRequestBodyFromJson(json);
}
