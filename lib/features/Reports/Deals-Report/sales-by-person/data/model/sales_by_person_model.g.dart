// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_by_person_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalesByPersonModel _$SalesByPersonModelFromJson(Map<String, dynamic> json) =>
    SalesByPersonModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SalesByPersonModelToJson(SalesByPersonModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      dealName: json['deal_name'] as String?,
      amount: json['amount'] as String?,
      closingDate: json['closing_date'] as String?,
      createdBy: json['created_by'] as String?,
      dealOwnerId: (json['deal_owner_id'] as num?)?.toInt(),
      leadSource: json['lead_source'] as String?,
      createdAtFormated: json['created_at_formated'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      campaign: json['campaign'] == null
          ? null
          : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'deal_name': instance.dealName,
      'amount': instance.amount,
      'closing_date': instance.closingDate,
      'created_by': instance.createdBy,
      'deal_owner_id': instance.dealOwnerId,
      'lead_source': instance.leadSource,
      'created_at_formated': instance.createdAtFormated,
      'client': instance.client,
      'owner': instance.owner,
      'campaign': instance.campaign,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      brokerId: (json['broker_id'] as num?)?.toInt(),
      campaingId: (json['campaign_id'] as num?)?.toInt(),
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
      convertedDealId: (json['converted_deal_id'] as num?)?.toInt(),
      convertedContactId: (json['converted_contact_id'] as num?)?.toInt(),
      convertedLeadId: (json['converted_lead_id'] as num?)?.toInt(),
      isConverted: (json['is_converted'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      deletedAt: json['deleted_at'] as String?,
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
      'campaign_id': instance.campaingId,
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

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
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

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      id: (json['id'] as num?)?.toInt(),
      campaignOwnerId: (json['campaign_owner_id'] as num?)?.toInt(),
      campaignOwner: json['campaign_owner'] as String?,
      tenantId: json['tenant_id'] as String?,
      createdBy: json['created_by'] as String?,
      type: json['type'] as String?,
      campaignName: json['campaign_name'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      expectedRevenue: (json['expected_revenue'] as num?)?.toInt(),
      budgetCost: (json['budget_cost'] as num?)?.toInt(),
      actualCost: (json['actual_cost'] as num?)?.toInt(),
      expectedResponse: json['expected_response'] as String?,
      numbersSent: json['numbers_sent'] as String?,
      description: json['description'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'campaign_owner_id': instance.campaignOwnerId,
      'campaign_owner': instance.campaignOwner,
      'tenant_id': instance.tenantId,
      'created_by': instance.createdBy,
      'type': instance.type,
      'campaign_name': instance.campaignName,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'expected_revenue': instance.expectedRevenue,
      'budget_cost': instance.budgetCost,
      'actual_cost': instance.actualCost,
      'expected_response': instance.expectedResponse,
      'numbers_sent': instance.numbersSent,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
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
