// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealsModel _$DealsModelFromJson(Map<String, dynamic> json) => DealsModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      deals: (json['deals'] as List<dynamic>?)
          ?.map((e) => Deals.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as List<dynamic>?)
          ?.map((e) => Users.fromJson(e as Map<String, dynamic>))
          .toList(),
      clients: (json['clients'] as List<dynamic>?)
          ?.map((e) => Clients.fromJson(e as Map<String, dynamic>))
          .toList(),
      campaigns: (json['campaigns'] as List<dynamic>?)
          ?.map((e) => Campaigns.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => Projects.fromJson(e as Map<String, dynamic>))
          .toList(),
      brokers: (json['brokers'] as List<dynamic>?)
          ?.map((e) => Brokers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DealsModelToJson(DealsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'deals': instance.deals,
      'users': instance.users,
      'clients': instance.clients,
      'campaigns': instance.campaigns,
      'projects': instance.projects,
      'brokers': instance.brokers,
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
      installmentYears: (json['installment_years'] as num?)?.toInt(),
      downPayment: json['down_payment'],
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      client: json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>),
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
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

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
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
      website: json['website'],
      rating: json['rating'],
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
      website: json['website'],
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

Campaigns _$CampaignsFromJson(Map<String, dynamic> json) => Campaigns(
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

Map<String, dynamic> _$CampaignsToJson(Campaigns instance) => <String, dynamic>{
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

Projects _$ProjectsFromJson(Map<String, dynamic> json) => Projects(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      projectUnits: (json['project_units'] as List<dynamic>?)
          ?.map((e) => ProjectUnits.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectDownPayments: (json['project_down_payments'] as List<dynamic>?)
          ?.map((e) => ProjectDownPayments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectsToJson(Projects instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'created_by': instance.createdBy,
      'name': instance.name,
      'size': instance.size,
      'location': instance.location,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'project_units': instance.projectUnits,
      'project_down_payments': instance.projectDownPayments,
    };

ProjectUnits _$ProjectUnitsFromJson(Map<String, dynamic> json) => ProjectUnits(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num?)?.toInt(),
      salesId: (json['sales_id'] as num?)?.toInt(),
      unitType: json['unit_type'] as String?,
      unitCode: json['unit_code'] as String?,
      unitNumber: json['unit_number'] as String?,
      buildingCode: json['building_code'] as String?,
      buildingNumber: json['building_number'] as String?,
      gardenArea: json['garden_area'] as String?,
      roofArea: json['roof_area'] as String?,
      garagePrice: json['garage_price'] as String?,
      meterPrice: json['meter_price'] as String?,
      unitArea: json['unit_area'] as String?,
      totalPrice: json['total_price'] as String?,
      floor: json['floor'],
      status: json['status'] as String?,
      reservationStatus: json['reservation_status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$ProjectUnitsToJson(ProjectUnits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'project_id': instance.projectId,
      'sales_id': instance.salesId,
      'unit_type': instance.unitType,
      'unit_code': instance.unitCode,
      'unit_number': instance.unitNumber,
      'building_code': instance.buildingCode,
      'building_number': instance.buildingNumber,
      'garden_area': instance.gardenArea,
      'roof_area': instance.roofArea,
      'garage_price': instance.garagePrice,
      'meter_price': instance.meterPrice,
      'unit_area': instance.unitArea,
      'total_price': instance.totalPrice,
      'floor': instance.floor,
      'status': instance.status,
      'reservation_status': instance.reservationStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

ProjectDownPayments _$ProjectDownPaymentsFromJson(Map<String, dynamic> json) =>
    ProjectDownPayments(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      downPaymentId: (json['down_payment_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      downPayment: json['down_payment'] == null
          ? null
          : DownPayment.fromJson(json['down_payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDownPaymentsToJson(
        ProjectDownPayments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'project_id': instance.projectId,
      'down_payment_id': instance.downPaymentId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'down_payment': instance.downPayment,
    };

DownPayment _$DownPaymentFromJson(Map<String, dynamic> json) => DownPayment(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      planName: json['plan_name'] as String?,
      downPaymentPercentage: (json['down_payment_percentage'] as num?)?.toInt(),
      years: (json['years'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DownPaymentToJson(DownPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'created_by': instance.createdBy,
      'plan_name': instance.planName,
      'down_payment_percentage': instance.downPaymentPercentage,
      'years': instance.years,
      'discount': instance.discount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Brokers _$BrokersFromJson(Map<String, dynamic> json) => Brokers(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      ownerId: (json['owner_id'] as num?)?.toInt(),
      email: json['email'] as String?,
      companyName: json['company_name'] as String?,
      commercialRegister: json['commercial_register'] as String?,
      taxCard: json['tax_card'] as String?,
      address: json['address'] as String?,
      personName: json['person_name'] as String?,
      mobile: json['mobile'] as String?,
      mobile2: json['mobile_2'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$BrokersToJson(Brokers instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'owner_id': instance.ownerId,
      'email': instance.email,
      'company_name': instance.companyName,
      'commercial_register': instance.commercialRegister,
      'tax_card': instance.taxCard,
      'address': instance.address,
      'person_name': instance.personName,
      'mobile': instance.mobile,
      'mobile_2': instance.mobile2,
      'assigned_to_id': instance.assignedToId,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
