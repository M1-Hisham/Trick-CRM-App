// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leads_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeadsViewModel _$LeadsViewModelFromJson(Map<String, dynamic> json) =>
    LeadsViewModel(
      lead: json['lead'] == null
          ? null
          : Lead.fromJson(json['lead'] as Map<String, dynamic>),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      leadNotes: (json['leadNotes'] as List<dynamic>?)
          ?.map((e) => LeadNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leadAttatchment: (json['leadAttatchment'] as List<dynamic>?)
          ?.map((e) => LeadAttatchment.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityLog: (json['activity_log'] as List<dynamic>?)
          ?.map((e) => ActivityLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      openActivity: (json['openActivity'] as List<dynamic>?)
          ?.map((e) => OpenActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      closedActivity: (json['closedActivity'] as List<dynamic>?)
          ?.map((e) => ClosedActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      campaignLeads: (json['campaignLeads'] as List<dynamic>?)
          ?.map((e) => CampaignLeadsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => CampaignsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leadMails: (json['leadMails'] as List<dynamic>?)
          ?.map((e) => LeadMailsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      calls: (json['calls'] as List<dynamic>?)
          ?.map((e) => Calls.fromJson(e as Map<String, dynamic>))
          .toList(),
      clients: (json['clients'] as List<dynamic>?)
          ?.map((e) => Clients.fromJson(e as Map<String, dynamic>))
          .toList(),
      deals: (json['deals'] as List<dynamic>?)
          ?.map((e) => Deals.fromJson(e as Map<String, dynamic>))
          .toList(),
      hostUsers: (json['hostUsers'] as List<dynamic>?)
          ?.map((e) => HostUsers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeadsViewModelToJson(LeadsViewModel instance) =>
    <String, dynamic>{
      'lead': instance.lead,
      'users': instance.users,
      'leadNotes': instance.leadNotes,
      'leadAttatchment': instance.leadAttatchment,
      'activity_log': instance.activityLog,
      'openActivity': instance.openActivity,
      'closedActivity': instance.closedActivity,
      'campaignLeads': instance.campaignLeads,
      'campaigns': instance.campaigns,
      'leadMails': instance.leadMails,
      'calls': instance.calls,
      'clients': instance.clients,
      'deals': instance.deals,
      'hostUsers': instance.hostUsers,
    };

Lead _$LeadFromJson(Map<String, dynamic> json) => Lead(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      compaingId: (json['compaing_id'] as num?)?.toInt(),
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
      fbLeadId: json['fb_lead_id'],
      fbAdName: json['fb_ad_name'] as String?,
      fbCampaignName: json['fb_campaign_name'] as String?,
      convertedDealId: (json['converted_deal_id'] as num?)?.toInt(),
      convertedClientId: (json['converted_client_id'] as num?)?.toInt(),
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

Map<String, dynamic> _$LeadToJson(Lead instance) => <String, dynamic>{
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

Calls _$CallsFromJson(Map<String, dynamic> json) => Calls(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      callTo: json['call_to'] as String?,
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
      lead: json['lead'],
      owner: json['owner'] == null
          ? null
          : CallsOwner.fromJson(json['owner'] as Map<String, dynamic>),
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      contact: json['contact'] as String?,
    );

Map<String, dynamic> _$CallsToJson(Calls instance) => <String, dynamic>{
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
      'lead': instance.lead,
      'owner': instance.owner,
      'client': instance.client,
      'contact': instance.contact,
    };

CallsOwner _$CallsOwnerFromJson(Map<String, dynamic> json) => CallsOwner(
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
          : CallsOwnerDepartment.fromJson(
              json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallsOwnerToJson(CallsOwner instance) =>
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

CallsOwnerDepartment _$CallsOwnerDepartmentFromJson(
        Map<String, dynamic> json) =>
    CallsOwnerDepartment(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CallsOwnerDepartmentToJson(
        CallsOwnerDepartment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      brokerId: json['broker_id'],
      campaingId: json['campaing_id'],
      saluation: json['saluation'],
      ownerName: json['owner_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      clientName: json['client_name'] as String?,
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
      convertedDealId: json['converted_deal_id'],
      convertedContactId: json['converted_contact_id'],
      convertedLeadId: json['converted_lead_id'],
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      arName: json['ar_name'] as String?,
      nationalId: json['national_id'] as String?,
      passportId: json['passport_id'] as String?,
      nationality: json['nationality'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'assigned_to_id': instance.assignedToId,
      'broker_id': instance.brokerId,
      'campaing_id': instance.campaingId,
      'saluation': instance.saluation,
      'owner_name': instance.ownerName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'client_name': instance.clientName,
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
      'converted_deal_id': instance.convertedDealId,
      'converted_contact_id': instance.convertedContactId,
      'converted_lead_id': instance.convertedLeadId,
      'is_converted': instance.isConverted,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ar_name': instance.arName,
      'national_id': instance.nationalId,
      'passport_id': instance.passportId,
      'nationality': instance.nationality,
      'address': instance.address,
    };

Clients _$ClientsFromJson(Map<String, dynamic> json) => Clients(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      brokerId: json['broker_id'],
      campaingId: json['campaing_id'],
      saluation: json['saluation'] as String?,
      ownerName: json['owner_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      clientName: json['client_name'] as String?,
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
      convertedDealId: json['converted_deal_id'],
      convertedContactId: json['converted_contact_id'],
      convertedLeadId: (json['converted_lead_id'] as num?)?.toInt(),
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      arName: json['ar_name'] as String?,
      nationalId: json['national_id'] as String?,
      passportId: json['passport_id'] as String?,
      nationality: json['nationality'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$ClientsToJson(Clients instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'assigned_to_id': instance.assignedToId,
      'broker_id': instance.brokerId,
      'campaing_id': instance.campaingId,
      'saluation': instance.saluation,
      'owner_name': instance.ownerName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'client_name': instance.clientName,
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
      'converted_deal_id': instance.convertedDealId,
      'converted_contact_id': instance.convertedContactId,
      'converted_lead_id': instance.convertedLeadId,
      'is_converted': instance.isConverted,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ar_name': instance.arName,
      'national_id': instance.nationalId,
      'passport_id': instance.passportId,
      'nationality': instance.nationality,
      'address': instance.address,
    };

Deals _$DealsFromJson(Map<String, dynamic> json) => Deals(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      dealOwnerId: (json['deal_owner_id'] as num?)?.toInt(),
      brokerId: json['broker_id'],
      dealName: json['deal_name'] as String?,
      clientId: (json['client_id'] as num?)?.toInt(),
      leadSource: json['lead_source'] as String?,
      amount: json['amount'] as String?,
      campaignId: json['campaign_id'],
      description: json['description'] as String?,
      closingDate: json['closing_date'] as String?,
      createdBy: json['created_by'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      downPaymentId: (json['down_payment_id'] as num?)?.toInt(),
      area: json['area'],
      installmentYears: json['installment_years'],
      downPayment: json['down_payment'],
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      client: json['client'] == null
          ? null
          : DealsClient.fromJson(json['client'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : DealsUsers.fromJson(json['owner'] as Map<String, dynamic>),
      campaign: json['campaign'],
    );

Map<String, dynamic> _$DealsToJson(Deals instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'deal_owner_id': instance.dealOwnerId,
      'broker_id': instance.brokerId,
      'deal_name': instance.dealName,
      'client_id': instance.clientId,
      'lead_source': instance.leadSource,
      'amount': instance.amount,
      'campaign_id': instance.campaignId,
      'description': instance.description,
      'closing_date': instance.closingDate,
      'created_by': instance.createdBy,
      'project_id': instance.projectId,
      'unit_id': instance.unitId,
      'down_payment_id': instance.downPaymentId,
      'area': instance.area,
      'installment_years': instance.installmentYears,
      'down_payment': instance.downPayment,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'client': instance.client,
      'owner': instance.owner,
      'campaign': instance.campaign,
    };

DealsClient _$DealsClientFromJson(Map<String, dynamic> json) => DealsClient(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      brokerId: json['broker_id'],
      campaingId: json['campaing_id'],
      saluation: json['saluation'],
      ownerName: json['owner_name'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      clientName: json['client_name'] as String?,
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
      convertedDealId: json['converted_deal_id'],
      convertedContactId: json['converted_contact_id'],
      convertedLeadId: json['converted_lead_id'],
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'],
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      arName: json['ar_name'] as String?,
      nationalId: json['national_id'] as String?,
      passportId: json['passport_id'] as String?,
      nationality: json['nationality'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$DealsClientToJson(DealsClient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'assigned_to_id': instance.assignedToId,
      'broker_id': instance.brokerId,
      'campaing_id': instance.campaingId,
      'saluation': instance.saluation,
      'owner_name': instance.ownerName,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'client_name': instance.clientName,
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
      'converted_deal_id': instance.convertedDealId,
      'converted_contact_id': instance.convertedContactId,
      'converted_lead_id': instance.convertedLeadId,
      'is_converted': instance.isConverted,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ar_name': instance.arName,
      'national_id': instance.nationalId,
      'passport_id': instance.passportId,
      'nationality': instance.nationality,
      'address': instance.address,
    };

DealsUsers _$DealsUsersFromJson(Map<String, dynamic> json) => DealsUsers(
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

Map<String, dynamic> _$DealsUsersToJson(DealsUsers instance) =>
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

HostUsers _$HostUsersFromJson(Map<String, dynamic> json) => HostUsers(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'],
      companyId: json['company_id'],
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

Map<String, dynamic> _$HostUsersToJson(HostUsers instance) => <String, dynamic>{
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
