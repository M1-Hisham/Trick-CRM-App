import 'package:json_annotation/json_annotation.dart';

import '../../open-meetings/data/model/meeting_model.dart';
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
  MeetingModel? meeting;

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
