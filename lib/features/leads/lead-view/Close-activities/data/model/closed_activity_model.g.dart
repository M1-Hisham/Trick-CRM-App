// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closed_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosedActivityModel _$ClosedActivityModelFromJson(Map<String, dynamic> json) =>
    ClosedActivityModel(
      id: (json['id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskId: (json['task_id'] as num?)?.toInt(),
      meetingId: json['meeting_id'],
      callId: json['call_id'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      call: json['call'],
      meeting: json['meeting'],
    );

Map<String, dynamic> _$ClosedActivityModelToJson(
        ClosedActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_id': instance.leadId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'task_id': instance.taskId,
      'meeting_id': instance.meetingId,
      'call_id': instance.callId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'task': instance.task,
      'call': instance.call,
      'meeting': instance.meeting,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskOwner: json['task_owner'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      clientId: json['client_id'],
      subject: json['subject'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      description: json['description'] as String?,
      dueDate: json['dueDate'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'task_owner': instance.taskOwner,
      'assigned_to_id': instance.assignedToId,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'subject': instance.subject,
      'status': instance.status,
      'priority': instance.priority,
      'description': instance.description,
      'dueDate': instance.dueDate,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
