import 'package:json_annotation/json_annotation.dart';

part 'activity_log_model.g.dart';

@JsonSerializable()
class ActivityLog {
  int? id;
  @JsonKey(name: 'log_name')
  String? logName;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? description;
  @JsonKey(name: 'subject_type')
  String? subjectType;
  String? event;
  @JsonKey(name: 'subject_id')
  int? subjectId;
  @JsonKey(name: 'causer_type')
  String? causerType;
  @JsonKey(name: 'causer_id')
  int? causerId;
  dynamic properties;
  @JsonKey(name: 'batch_uuid')
  dynamic batchUuid;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Causer? causer;
  Subject? subject;

  ActivityLog({
    this.id,
    this.logName,
    this.tenantId,
    this.description,
    this.subjectType,
    this.event,
    this.subjectId,
    this.causerType,
    this.causerId,
    this.properties,
    this.batchUuid,
    this.createdAt,
    this.updatedAt,
    this.causer,
    this.subject,
  });

  factory ActivityLog.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogFromJson(json);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? comment;
  Attributes? attributes;

  Properties({this.tenantId, this.comment, this.attributes});

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}

@JsonSerializable()
class Attributes {
  String? city;
  String? email;
  String? image;
  String? state;
  String? mobile;
  String? rating;
  String? company;
  String? country;
  @JsonKey(name: 'user_id')
  int? userId;
  String? website;
  @JsonKey(name: 'end_time')
  String? endTime;
  String? industry;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_lead_id')
  String? fbLeadId;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'compaing_id')
  String? compaingId;
  String? description;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'fb_campaign_name')
  dynamic fbCampaignName;

  Attributes({
    this.city,
    this.email,
    this.image,
    this.state,
    this.mobile,
    this.rating,
    this.company,
    this.country,
    this.userId,
    this.website,
    this.endTime,
    this.industry,
    this.mobile2,
    this.jobTitle,
    this.lastName,
    this.leadName,
    this.tenantId,
    this.fbAdName,
    this.fbLeadId,
    this.firstName,
    this.ownerName,
    this.compaingId,
    this.description,
    this.leadSource,
    this.leadStatus,
    this.isConverted,
    this.endTimeHour,
    this.assignedToId,
    this.fbCampaignName,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@JsonSerializable()
class Causer {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  String? departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  dynamic department;

  Causer({
    this.id,
    this.name,
    this.email,
    this.tenantId,
    this.emailVerifiedAt,
    this.departmentId,
    this.companyId,
    this.avatar,
    this.roleAs,
    this.isTenant,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.department,
  });

  factory Causer.fromJson(Map<String, dynamic> json) => _$CauserFromJson(json);
}

@JsonSerializable()
class Subject {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'compaing_id')
  String? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  String? website;
  String? rating;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? industry;
  @JsonKey(name: 'annual_revenue')
  int? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  @JsonKey(name: 'fb_lead_id')
  String? fbLeadId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_campaign_name')
  String? fbCampaignName;
  @JsonKey(name: 'converted_deal_id')
  String? convertedDealId;
  @JsonKey(name: 'converted_client_id')
  String? convertedClientId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Assigned? assigned;

  Subject({
    this.id,
    this.userId,
    this.assignedToId,
    this.tenantId,
    this.compaingId,
    this.saluation,
    this.ownerName,
    this.firstName,
    this.lastName,
    this.leadName,
    this.company,
    this.jobTitle,
    this.email,
    this.mobile,
    this.mobile2,
    this.website,
    this.rating,
    this.leadStatus,
    this.leadSource,
    this.industry,
    this.annualRevenue,
    this.image,
    this.country,
    this.city,
    this.state,
    this.description,
    this.fbLeadId,
    this.fbAdName,
    this.fbCampaignName,
    this.convertedDealId,
    this.convertedClientId,
    this.isConverted,
    this.endTime,
    this.endTimeHour,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.assigned,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@JsonSerializable()
class Assigned {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  int? departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  AssignedDepartment? department;

  Assigned({
    this.id,
    this.name,
    this.email,
    this.tenantId,
    this.emailVerifiedAt,
    this.departmentId,
    this.companyId,
    this.avatar,
    this.roleAs,
    this.isTenant,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.department,
  });

  factory Assigned.fromJson(Map<String, dynamic> json) =>
      _$AssignedFromJson(json);
}

@JsonSerializable()
class AssignedDepartment {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  AssignedDepartment(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory AssignedDepartment.fromJson(Map<String, dynamic> json) =>
      _$AssignedDepartmentFromJson(json);
}
