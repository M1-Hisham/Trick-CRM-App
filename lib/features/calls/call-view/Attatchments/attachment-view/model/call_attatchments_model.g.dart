// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_attatchments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CallAttatchmentsModel _$CallAttatchmentsModelFromJson(
        Map<String, dynamic> json) =>
    CallAttatchmentsModel(
      id: (json['id'] as num?)?.toInt(),
      callId: (json['call_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      user: json['user'] == null
          ? null
          : Assigned.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallAttatchmentsModelToJson(
        CallAttatchmentsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'call_id': instance.callId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'url': instance.url,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
    };

Assigned _$AssignedFromJson(Map<String, dynamic> json) => Assigned(
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
