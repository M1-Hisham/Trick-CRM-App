// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_meeting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenMeetingModel _$OpenMeetingModelFromJson(Map<String, dynamic> json) =>
    OpenMeetingModel(
      id: (json['id'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      hostId: (json['host_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'],
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      allDay: (json['all_day'] as num?)?.toInt(),
      participants: json['participants'] as String?,
      relatedTo: json['related_to'] as String?,
      relatedToClient: json['related_to_client'],
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      dealId: (json['deal_id'] as num?)?.toInt(),
      compaignId: (json['compaign_id'] as num?)?.toInt(),
      host: json['host'] == null
          ? null
          : Host.fromJson(json['host'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenMeetingModelToJson(OpenMeetingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'host_id': instance.hostId,
      'tenant_id': instance.tenantId,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'all_day': instance.allDay,
      'participants': instance.participants,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deal_id': instance.dealId,
      'compaign_id': instance.compaignId,
      'host': instance.host,
    };

Host _$HostFromJson(Map<String, dynamic> json) => Host(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
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

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
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
