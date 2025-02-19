// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attachments_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadAttatchment _$LeadAttatchmentFromJson(Map<String, dynamic> json) =>
    LeadAttatchment(
      id: (json['id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      url: json['url'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      userAttatchment: json['user_attatchment'] == null
          ? null
          : UserAttatchment.fromJson(
              json['user_attatchment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LeadAttatchmentToJson(LeadAttatchment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_id': instance.leadId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'url': instance.url,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user_attatchment': instance.userAttatchment,
    };

UserAttatchment _$UserAttatchmentFromJson(Map<String, dynamic> json) =>
    UserAttatchment(
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

Map<String, dynamic> _$UserAttatchmentToJson(UserAttatchment instance) =>
    <String, dynamic>{
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
