// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_lead_task_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateLeadTaskRequestBody _$CreateLeadTaskRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateLeadTaskRequestBody(
      subject: json['subject'] as String,
      description: json['description'] as String?,
      dueDate: json['due_date'] as String?,
      assignedToId: (json['assigned_to_id'] as num).toInt(),
      priority: json['priority'] as String,
      leadId: (json['lead_id'] as num?)?.toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CreateLeadTaskRequestBodyToJson(
        CreateLeadTaskRequestBody instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'description': instance.description,
      'due_date': instance.dueDate,
      'assigned_to_id': instance.assignedToId,
      'priority': instance.priority,
      'lead_id': instance.leadId,
      'status': instance.status,
    };
