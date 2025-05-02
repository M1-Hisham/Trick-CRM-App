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
          : ClosedTaskModel.fromJson(json['task'] as Map<String, dynamic>),
      call: json['call'] == null
          ? null
          : ClosedCallModel.fromJson(json['call'] as Map<String, dynamic>),
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
    };
