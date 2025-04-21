// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_log_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActivityLog _$ActivityLogFromJson(Map<String, dynamic> json) => ActivityLog(
      id: (json['id'] as num?)?.toInt(),
      logName: json['log_name'] as String?,
      tenantId: json['tenant_id'] as String?,
      description: json['description'] as String?,
      subjectType: json['subject_type'] as String?,
      event: json['event'] as String?,
      subjectId: (json['subject_id'] as num?)?.toInt(),
      causerType: json['causer_type'] as String?,
      causerId: (json['causer_id'] as num?)?.toInt(),
      properties: json['properties'],
      batchUuid: json['batch_uuid'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      causer: json['causer'] == null
          ? null
          : Causer.fromJson(json['causer'] as Map<String, dynamic>),
      subject: json['subject'] == null
          ? null
          : Subject.fromJson(json['subject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ActivityLogToJson(ActivityLog instance) =>
    <String, dynamic>{
      'id': instance.id,
      'log_name': instance.logName,
      'tenant_id': instance.tenantId,
      'description': instance.description,
      'subject_type': instance.subjectType,
      'event': instance.event,
      'subject_id': instance.subjectId,
      'causer_type': instance.causerType,
      'causer_id': instance.causerId,
      'properties': instance.properties,
      'batch_uuid': instance.batchUuid,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'causer': instance.causer,
      'subject': instance.subject,
    };

Properties _$PropertiesFromJson(Map<String, dynamic> json) => Properties(
      tenantId: json['tenant_id'] as String?,
      comment: json['comment'] as String?,
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertiesToJson(Properties instance) =>
    <String, dynamic>{
      'tenant_id': instance.tenantId,
      'comment': instance.comment,
      'attributes': instance.attributes,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      city: json['city'] as String?,
      email: json['email'] as String?,
      image: json['image'] as String?,
      state: json['state'] as String?,
      mobile: json['mobile'] as String?,
      rating: json['rating'] as String?,
      company: json['company'] as String?,
      country: json['country'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      website: json['website'] as String?,
      endTime: json['end_time'] as String?,
      industry: json['industry'] as String?,
      mobile2: json['mobile_2'] as String?,
      jobTitle: json['job_title'] as String?,
      lastName: json['last_name'] as String?,
      leadName: json['lead_name'] as String?,
      tenantId: json['tenant_id'] as String?,
      fbAdName: json['fb_ad_name'] as String?,
      fbLeadId: json['fb_lead_id'] as String?,
      firstName: json['first_name'] as String?,
      ownerName: json['owner_name'] as String?,
      compaingId: json['compaing_id'] as String?,
      description: json['description'] as String?,
      leadSource: json['lead_source'] as String?,
      leadStatus: json['lead_status'] as String?,
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTimeHour: json['end_time_hour'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      fbCampaignName: json['fb_campaign_name'],
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'city': instance.city,
      'email': instance.email,
      'image': instance.image,
      'state': instance.state,
      'mobile': instance.mobile,
      'rating': instance.rating,
      'company': instance.company,
      'country': instance.country,
      'user_id': instance.userId,
      'website': instance.website,
      'end_time': instance.endTime,
      'industry': instance.industry,
      'mobile_2': instance.mobile2,
      'job_title': instance.jobTitle,
      'last_name': instance.lastName,
      'lead_name': instance.leadName,
      'tenant_id': instance.tenantId,
      'fb_ad_name': instance.fbAdName,
      'fb_lead_id': instance.fbLeadId,
      'first_name': instance.firstName,
      'owner_name': instance.ownerName,
      'compaing_id': instance.compaingId,
      'description': instance.description,
      'lead_source': instance.leadSource,
      'lead_status': instance.leadStatus,
      'is_converted': instance.isConverted,
      'end_time_hour': instance.endTimeHour,
      'assigned_to_id': instance.assignedToId,
      'fb_campaign_name': instance.fbCampaignName,
    };

Causer _$CauserFromJson(Map<String, dynamic> json) => Causer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'] as String?,
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'],
    );

Map<String, dynamic> _$CauserToJson(Causer instance) => <String, dynamic>{
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

Subject _$SubjectFromJson(Map<String, dynamic> json) => Subject(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      compaingId: json['compaing_id'] as String?,
      saluation: json['saluation'] as String?,
      ownerName: json['owner_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      leadName: json['lead_name'] as String?,
      company: json['company'] as String?,
      jobTitle: json['job_title'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      mobile2: json['mobile_2'] as String?,
      website: json['website'] as String?,
      rating: json['rating'] as String?,
      leadStatus: json['lead_status'] as String?,
      leadSource: json['lead_source'] as String?,
      industry: json['industry'] as String?,
      annualRevenue: (json['annual_revenue'] as num?)?.toInt(),
      image: json['image'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      description: json['description'] as String?,
      fbLeadId: json['fb_lead_id'] as String?,
      fbAdName: json['fb_ad_name'] as String?,
      fbCampaignName: json['fb_campaign_name'] as String?,
      convertedDealId: json['converted_deal_id'] as String?,
      convertedClientId: json['converted_client_id'] as String?,
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      assigned: json['assigned'] == null
          ? null
          : Assigned.fromJson(json['assigned'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubjectToJson(Subject instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'assigned_to_id': instance.assignedToId,
      'tenant_id': instance.tenantId,
      'compaing_id': instance.compaingId,
      'saluation': instance.saluation,
      'owner_name': instance.ownerName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'lead_name': instance.leadName,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'email': instance.email,
      'mobile': instance.mobile,
      'mobile_2': instance.mobile2,
      'website': instance.website,
      'rating': instance.rating,
      'lead_status': instance.leadStatus,
      'lead_source': instance.leadSource,
      'industry': instance.industry,
      'annual_revenue': instance.annualRevenue,
      'image': instance.image,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'description': instance.description,
      'fb_lead_id': instance.fbLeadId,
      'fb_ad_name': instance.fbAdName,
      'fb_campaign_name': instance.fbCampaignName,
      'converted_deal_id': instance.convertedDealId,
      'converted_client_id': instance.convertedClientId,
      'is_converted': instance.isConverted,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'assigned': instance.assigned,
    };

Assigned _$AssignedFromJson(Map<String, dynamic> json) => Assigned(
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
          : AssignedDepartment.fromJson(
              json['department'] as Map<String, dynamic>),
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

AssignedDepartment _$AssignedDepartmentFromJson(Map<String, dynamic> json) =>
    AssignedDepartment(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$AssignedDepartmentToJson(AssignedDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
