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
          : Call.fromJson(json['call'] as Map<String, dynamic>),
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

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      callTo: json['call_to'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      relatedTo: json['related_to'],
      relatedToClient: json['related_to_client'],
      clientId: json['client_id'],
      dealId: json['deal_id'],
      campaignId: json['campaign_id'],
      callType: json['call_type'],
      callStatus: json['call_status'] as String?,
      startTime: json['start_time'],
      startTimeHour: json['start_time_hour'] as String?,
      callOwnerId: (json['call_owner_id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      callPurpose: json['call_purpose'],
      callAgenda: json['call_agenda'],
      callResult: json['call_result'],
      description: json['description'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'call_to': instance.callTo,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'client_id': instance.clientId,
      'deal_id': instance.dealId,
      'campaign_id': instance.campaignId,
      'call_type': instance.callType,
      'call_status': instance.callStatus,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'call_owner_id': instance.callOwnerId,
      'subject': instance.subject,
      'call_purpose': instance.callPurpose,
      'call_agenda': instance.callAgenda,
      'call_result': instance.callResult,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'owner': instance.owner,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'],
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'],
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenant_id': instance.tenantId,
      'email_verified_at': instance.emailVerifiedAt,
      'department_id': instance.departmentId,
      'company_id': instance.companyId,
      'avatar': instance.avatar,
      'role_as': instance.roleAs,
      'is_tenant': instance.isTenant,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'department': instance.department,
    };
