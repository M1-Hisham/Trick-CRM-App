// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenActivityModel _$OpenActivityModelFromJson(Map<String, dynamic> json) =>
    OpenActivityModel(
      id: (json['id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskId: (json['task_id'] as num?)?.toInt(),
      meetingId: (json['meeting_id'] as num?)?.toInt(),
      callId: (json['call_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      task: json['task'] == null
          ? null
          : TaskModel.fromJson(json['task'] as Map<String, dynamic>),
      call: json['call'] == null
          ? null
          : OpenCallModel.fromJson(json['call'] as Map<String, dynamic>),
      meeting: json['meeting'] == null
          ? null
          : MeetingModel.fromJson(json['meeting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenActivityModelToJson(OpenActivityModel instance) =>
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
