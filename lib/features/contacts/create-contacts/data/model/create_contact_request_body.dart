import 'package:json_annotation/json_annotation.dart';

part 'create_contact_request_body.g.dart';

@JsonSerializable()
class CreateContactRequestBody {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String email;
  String mobile;
  String? image;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? industry;
  String? rating;
  @JsonKey(name: 'annual_revenue')
  int? annualRevenue;
  String? website;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? state;
  String? city;
  String? country;
  String? description;

  CreateContactRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    this.image,
    this.mobile2,
    this.assignedToId,
    this.endTime,
    this.endTimeHour,
    this.company,
    this.jobTitle,
    this.industry,
    this.rating,
    this.annualRevenue,
    this.website,
    this.leadSource,
    this.state,
    this.city,
    this.country,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateContactRequestBodyToJson(this);
}
