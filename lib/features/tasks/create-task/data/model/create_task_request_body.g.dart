// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskRequestBody _$CreateTaskRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateTaskRequestBody(
      subject: json['subject'] as String,
      assignedToId: (json['assigned_to_id'] as num).toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      status: json['status'] as String,
      priority: json['priority'] as String,
      clientId: (json['client_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      dueDate: json['due_date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateTaskRequestBodyToJson(
        CreateTaskRequestBody instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'assigned_to_id': instance.assignedToId,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'status': instance.status,
      'priority': instance.priority,
      'due_date': instance.dueDate,
      'description': instance.description,
    };
