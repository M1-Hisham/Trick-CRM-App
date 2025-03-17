import 'package:json_annotation/json_annotation.dart';

import '../../open-tasks/data/model/task_model.dart';

part 'open_activity_model.g.dart';

@JsonSerializable()
class OpenActivityModel {
  int? id;
  @JsonKey(name: "lead_id")
  int? leadId;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "task_id")
  int? taskId;
  @JsonKey(name: "meeting_id")
  int? meetingId;
  @JsonKey(name: "call_id")
  int? callId;
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  TaskModel? task;
  Call? call;
  Meeting? meeting;

  OpenActivityModel({
    this.id,
    this.leadId,
    this.userId,
    this.tenantId,
    this.taskId,
    this.meetingId,
    this.callId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.task,
    this.call,
    this.meeting,
  });
  factory OpenActivityModel.fromJson(Map<String, dynamic> json) =>
      _$OpenActivityModelFromJson(json);
}


@JsonSerializable()
class Call {
  int? id;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "call_to")
  String? callTo;
  @JsonKey(name: "lead_id")
  int? leadId;
  @JsonKey(name: "contact_id")
  dynamic contactId;
  @JsonKey(name: "related_to")
  dynamic relatedTo;
  @JsonKey(name: "related_to_client")
  dynamic relatedToClient;
  @JsonKey(name: "client_id")
  dynamic clientId;
  @JsonKey(name: "deal_id")
  dynamic dealId;
  @JsonKey(name: "campaign_id")
  dynamic campaignId;
  @JsonKey(name: "call_type")
  dynamic callType;
  @JsonKey(name: "call_status")
  String? callStatus;
  @JsonKey(name: "start_time")
  dynamic startTime;
  @JsonKey(name: "start_time_hour")
  String? startTimeHour;
  @JsonKey(name: "call_owner_id")
  int? callOwnerId;
  String? subject;
  @JsonKey(name: "call_purpose")
  dynamic callPurpose;
  @JsonKey(name: "call_agenda")
  dynamic callAgenda;
  @JsonKey(name: "call_result")
  dynamic callResult;
  String? description;
  @JsonKey(name: "is_deleted")
  int? isDeleted;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  Owner? owner;

  Call({
    this.id,
    this.tenantId,
    this.callTo,
    this.leadId,
    this.contactId,
    this.relatedTo,
    this.relatedToClient,
    this.clientId,
    this.dealId,
    this.campaignId,
    this.callType,
    this.callStatus,
    this.startTime,
    this.startTimeHour,
    this.callOwnerId,
    this.subject,
    this.callPurpose,
    this.callAgenda,
    this.callResult,
    this.description,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.owner,
  });
  factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
}

@JsonSerializable()
class Owner {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "email_verified_at")
  String? emailVerifiedAt;
  @JsonKey(name: "department_id")
  dynamic departmentId;
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
  dynamic department;

  Owner({
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

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@JsonSerializable()
class Meeting {
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

  Meeting({
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

  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
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
