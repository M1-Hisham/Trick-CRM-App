import 'package:json_annotation/json_annotation.dart';

part 'meeting_model.g.dart';

@JsonSerializable()
class MeetingModel {
  int? id;
  @JsonKey(name: "created_by")
  int? createdBy;
  @JsonKey(name: "host_id")
  int? hostId;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  String? title;
  String? location;
  String? description;
  @JsonKey(name: "start_time")
  String? startTime;
  @JsonKey(name: "start_time_hour")
  dynamic startTimeHour;
  @JsonKey(name: "end_time")
  String? endTime;
  @JsonKey(name: "end_time_hour")
  String? endTimeHour;
  @JsonKey(name: "all_day")
  int? allDay;
  String? participants;
  @JsonKey(name: "related_to")
  String? relatedTo;
  @JsonKey(name: "related_to_client")
  dynamic relatedToClient;
  @JsonKey(name: "lead_id")
  int? leadId;
  @JsonKey(name: "contact_id")
  int? contactId;
  @JsonKey(name: "client_id")
  int? clientId;
  String? status;
  @JsonKey(name: "is_deleted")
  int? isDeleted;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  @JsonKey(name: "deal_id")
  int? dealId;
  @JsonKey(name: "compaign_id")
  int? compaignId;
  Host? host;

  MeetingModel({
    this.id,
    this.createdBy,
    this.hostId,
    this.tenantId,
    this.title,
    this.location,
    this.description,
    this.startTime,
    this.startTimeHour,
    this.endTime,
    this.endTimeHour,
    this.allDay,
    this.participants,
    this.relatedTo,
    this.relatedToClient,
    this.leadId,
    this.contactId,
    this.clientId,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.dealId,
    this.compaignId,
    this.host,
  });

  factory MeetingModel.fromJson(Map<String, dynamic> json) =>
      _$MeetingModelFromJson(json);
}

@JsonSerializable()
class Host {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  @JsonKey(name: "department_id")
  int? departmentId;
  @JsonKey(name: "company_id")
  int? companyId;
  String? avatar;
  @JsonKey(name: "role_as")
  int? roleAs;
  @JsonKey(name: "is_tenant")
  int? isTenant;
  @JsonKey(name: "is_active")
  int? isActive;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  Department? department;

  Host({
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

  factory Host.fromJson(Map<String, dynamic> json) => _$HostFromJson(json);
}

@JsonSerializable()
class Department {
  int? id;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  String? name;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  Department(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}
