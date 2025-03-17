import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class TaskModel {
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "task_owner")
  String? taskOwner;
  @JsonKey(name: "assigned_to_id")
  int? assignedToId;
  @JsonKey(name: "lead_id")
  int? leadId;
  @JsonKey(name: "contact_id")
  int? contactId;
  @JsonKey(name: "client_id")
  int? clientId;
  String? subject;
  String? status;
  String? priority;
  String? description;
  @JsonKey(name: "due_date")
  String? dueDate;
  @JsonKey(name: "is_deleted")
  int? isDeleted;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;

  TaskModel({
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
  factory TaskModel.fromJson(Map<String, dynamic> json) => _$TaskModelFromJson(json); 
}
