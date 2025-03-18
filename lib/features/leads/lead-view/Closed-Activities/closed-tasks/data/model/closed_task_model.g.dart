// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closed_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosedTaskModel _$ClosedTaskModelFromJson(Map<String, dynamic> json) =>
    ClosedTaskModel(
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

Map<String, dynamic> _$ClosedTaskModelToJson(ClosedTaskModel instance) =>
    <String, dynamic>{
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
