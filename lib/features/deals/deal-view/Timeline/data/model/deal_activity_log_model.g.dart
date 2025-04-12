// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_activity_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealActivityLogModel _$DealActivityLogModelFromJson(
        Map<String, dynamic> json) =>
    DealActivityLogModel(
      id: (json['id'] as num?)?.toInt(),
      logName: json['log_name'] as String?,
      tenantId: json['tenant_id'] as String?,
      description: json['description'] as String?,
      subjectType: json['subjectType'] as String?,
      event: json['event'] as String?,
      subjectId: (json['subject_id'] as num?)?.toInt(),
      causerType: json['causer_type'] as String?,
      causerId: (json['causer_id'] as num?)?.toInt(),
      batchUuid: json['batch_uuid'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      causer: json['causer'] == null
          ? null
          : Assigned.fromJson(json['causer'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealActivityLogModelToJson(
        DealActivityLogModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'log_name': instance.logName,
      'tenant_id': instance.tenantId,
      'description': instance.description,
      'subjectType': instance.subjectType,
      'event': instance.event,
      'subject_id': instance.subjectId,
      'causer_type': instance.causerType,
      'causer_id': instance.causerId,
      'batch_uuid': instance.batchUuid,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'causer': instance.causer,
    };

Assigned _$AssignedFromJson(Map<String, dynamic> json) => Assigned(
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
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AssignedToJson(Assigned instance) => <String, dynamic>{
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
