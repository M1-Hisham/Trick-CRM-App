import 'package:json_annotation/json_annotation.dart';

part 'closed_activity_model.g.dart';

@JsonSerializable()
class ClosedActivityModel {
  int? id;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'task_id')
  int? taskId;
  @JsonKey(name: 'meeting_id')
  dynamic meetingId;
  @JsonKey(name: 'call_id')
  dynamic callId;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Task? task;
  dynamic call;
  dynamic meeting;

  ClosedActivityModel({
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
  factory ClosedActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ClosedActivityModelFromJson(json);
}

@JsonSerializable()
class Task {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'task_owner')
  String? taskOwner;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  dynamic contactId;
  @JsonKey(name: 'client_id')
  dynamic clientId;
  String? subject;
  String? status;
  String? priority;
  String? description;
  String? dueDate;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Task({
    this.id,
    this.userId,
    this.tenantId,
    this.taskOwner,
    this.assignedToId,
    this.leadId,
    this.contactId,
    this.clientId,
    this.subject,
    this.status,
    this.priority,
    this.description,
    this.dueDate,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
}
