import 'package:json_annotation/json_annotation.dart';

part 'create_client_request_body.g.dart';

@JsonSerializable()
class CreateClientRequestBody {
  @JsonKey(name: 'first_name')
  String firstName;
  @JsonKey(name: 'last_name')
  String lastName;
  String email;
  String mobile;
  @JsonKey(name: 'ar_name')
  String arName;
  @JsonKey(name: 'national_id')
  String nationalId;
  @JsonKey(name: 'passport_id')
  String passportId;
  @JsonKey(name: 'nationality')
  String arNationality;
  @JsonKey(name: 'address')
  String arAddress;

  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  String? description;
  String? image;
  String? state;
  String? city;
  String? country;
  String? industry;
  @JsonKey(name: 'annual_revenue')
  int? annualRevenue;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  String? rating;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? company;
  @JsonKey(name: 'client_name')
  String? clientName;

  CreateClientRequestBody({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.arName,
    required this.nationalId,
    required this.passportId,
    required this.arNationality,
    required this.arAddress,
    this.brokerId,
    this.assignedToId,
    this.ownerName,
    this.endTime,
    this.endTimeHour,
    this.description,
    this.image,
    this.state,
    this.city,
    this.country,
    this.industry,
    this.annualRevenue,
    this.leadSource,
    this.leadStatus,
    this.rating,
    this.mobile2,
    this.jobTitle,
    this.company,
    this.clientName,
  });

  Map<String, dynamic> toJson() => _$CreateClientRequestBodyToJson(this);
}
