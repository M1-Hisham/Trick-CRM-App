// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'closed_call_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClosedCallModel _$ClosedCallModelFromJson(Map<String, dynamic> json) =>
    ClosedCallModel(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenantId'] as String?,
      callTo: json['callTo'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      relatedTo: json['related_to'] as String?,
      relatedToClient: json['related_to_client'] as String?,
      clientId: (json['client_id'] as num?)?.toInt(),
      dealId: (json['deal_id'] as num?)?.toInt(),
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      callType: json['call_type'] as String?,
      callStatus: json['call_status'] as String?,
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'] as String?,
      callOwnerId: (json['call_owner_id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      callPurpose: json['call_purpose'] as String?,
      callAgenda: json['call_agenda'] as String?,
      callResult: json['call_result'] as String?,
      description: json['description'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ClosedCallModelToJson(ClosedCallModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'callTo': instance.callTo,
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
      emailVerifiedAt: json['email_verified_at'],
      departmentId: (json['department_id'] as num?)?.toInt(),
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
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

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
