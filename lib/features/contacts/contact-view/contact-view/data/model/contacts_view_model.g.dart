// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContactsViewModel _$ContactsViewModelFromJson(Map<String, dynamic> json) =>
    ContactsViewModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactNotes: (json['contactNotes'] as List<dynamic>?)
          ?.map((e) => ContactNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      contactAttatchment: (json['contactAttatchment'] as List<dynamic>?)
          ?.map((e) => ContactAttatchment.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityLog: (json['activity_log'] as List<dynamic>?)
          ?.map((e) =>
              ContactActivityLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContactsViewModelToJson(ContactsViewModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'contact': instance.contact,
      'users': instance.users,
      'contactNotes': instance.contactNotes,
      'contactAttatchment': instance.contactAttatchment,
      'activity_log': instance.activityLog,
    };

Contact _$ContactFromJson(Map<String, dynamic> json) => Contact(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      compaingId: (json['compaing_id'] as num?)?.toInt(),
      saluation: json['saluation'] as String?,
      ownerName: json['owner_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      contactName: json['contact_name'] as String?,
      company: json['company'] as String?,
      jobTitle: json['job_title'] as String?,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      mobile2: json['mobile_2'] as String?,
      website: json['website'] as String?,
      rating: json['rating'] as String?,
      leadSource: json['lead_source'] as String?,
      industry: json['industry'] as String?,
      annualRevenue: (json['annual_revenue'] as num?)?.toInt(),
      image: json['image'] as String?,
      country: json['country'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      description: json['description'] as String?,
      convertedDealId: json['converted_deal_id'],
      convertedClientId: json['converted_client_id'],
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      assigned: json['assigned'] == null
          ? null
          : Assigned.fromJson(json['assigned'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'assigned_to_id': instance.assignedToId,
      'compaing_id': instance.compaingId,
      'saluation': instance.saluation,
      'owner_name': instance.ownerName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'contact_name': instance.contactName,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'email': instance.email,
      'mobile': instance.mobile,
      'mobile_2': instance.mobile2,
      'website': instance.website,
      'rating': instance.rating,
      'lead_source': instance.leadSource,
      'industry': instance.industry,
      'annual_revenue': instance.annualRevenue,
      'image': instance.image,
      'country': instance.country,
      'city': instance.city,
      'state': instance.state,
      'description': instance.description,
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

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
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

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
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

ContactAttatchment _$ContactAttatchmentFromJson(Map<String, dynamic> json) =>
    ContactAttatchment(
      id: (json['id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
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

Map<String, dynamic> _$ContactAttatchmentToJson(ContactAttatchment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contact_id': instance.contactId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'url': instance.url,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'user': instance.user,
    };
