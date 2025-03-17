// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskOwner: json['task_owner'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      description: json['description'] as String?,
      dueDate: json['due_date'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
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
      'due_date': instance.dueDate,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
