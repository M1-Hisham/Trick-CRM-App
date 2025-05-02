// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DealViewModel _$DealViewModelFromJson(Map<String, dynamic> json) =>
    DealViewModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      deal: json['deal'] == null
          ? null
          : Deal.fromJson(json['deal'] as Map<String, dynamic>),
      dealAttachments: (json['dealAttachments'] as List<dynamic>?)
          ?.map(
              (e) => DealAttatchmentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      dealNotes: (json['dealNotes'] as List<dynamic>?)
          ?.map((e) => DealNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      projects: (json['projects'] as List<dynamic>?)
          ?.map((e) => Projects.fromJson(e as Map<String, dynamic>))
          .toList(),
      dealProject: json['dealProject'] == null
          ? null
          : Projects.fromJson(json['dealProject'] as Map<String, dynamic>),
      dealUnit: json['dealUnit'] == null
          ? null
          : DealUnit.fromJson(json['dealUnit'] as Map<String, dynamic>),
      unitPaymentPlan: json['unitPaymentPlan'] == null
          ? null
          : DownPaymentPlan.fromJson(
              json['unitPaymentPlan'] as Map<String, dynamic>),
      unitPlanDetails: json['unitPlanDetails'] == null
          ? null
          : DownPayment.fromJson(
              json['unitPlanDetails'] as Map<String, dynamic>),
      brokers: (json['brokers'] as List<dynamic>?)
          ?.map((e) => Brokers.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..activityLog = (json['activity_log'] as List<dynamic>?)
        ?.map((e) => DealActivityLogModel.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$DealViewModelToJson(DealViewModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'deal': instance.deal,
      'dealAttachments': instance.dealAttachments,
      'dealNotes': instance.dealNotes,
      'activity_log': instance.activityLog,
      'projects': instance.projects,
      'dealProject': instance.dealProject,
      'dealUnit': instance.dealUnit,
      'unitPaymentPlan': instance.unitPaymentPlan,
      'unitPlanDetails': instance.unitPlanDetails,
      'brokers': instance.brokers,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      dealOwnerId: (json['deal_owner_id'] as num?)?.toInt(),
      brokerId: (json['broker_id'] as num?)?.toInt(),
      dealName: json['deal_name'] as String?,
      clientId: (json['lead_id'] as num?)?.toInt(),
      leadSource: json['lead_source'] as String?,
      amount: json['amount'] as String?,
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      description: json['description'] as String?,
      closingDate: json['closing_date'] as String?,
      createdBy: json['created_by'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      downPaymentId: (json['down_payment_id'] as num?)?.toInt(),
      area: json['area'] as String?,
      installmentYears: (json['installment_years'] as num?)?.toInt(),
      downPayment: (json['down_payment'] as num?)?.toInt(),
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
      campaign: json['campaign'] == null
          ? null
          : CampaignDealViewModel.fromJson(
              json['campaign'] as Map<String, dynamic>),
      broker: json['broker'] == null
          ? null
          : Broker.fromJson(json['broker'] as Map<String, dynamic>),
      paymentPlan: json['payment_plan'] == null
          ? null
          : PaymentPlan.fromJson(json['payment_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'deal_owner_id': instance.dealOwnerId,
      'broker_id': instance.brokerId,
      'deal_name': instance.dealName,
      'lead_id': instance.clientId,
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
      'broker': instance.broker,
      'payment_plan': instance.paymentPlan,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      brokerId: (json['broker_id'] as num?)?.toInt(),
      campaingId: (json['campaing_id'] as num?)?.toInt(),
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

Broker _$BrokerFromJson(Map<String, dynamic> json) => Broker(
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

Map<String, dynamic> _$BrokerToJson(Broker instance) => <String, dynamic>{
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

PaymentPlan _$PaymentPlanFromJson(Map<String, dynamic> json) => PaymentPlan(
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

Map<String, dynamic> _$PaymentPlanToJson(PaymentPlan instance) =>
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
      deletedAt: json['deleted_at'] as String?,
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
      deletedAt: json['deleted_at'] as String?,
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
      deletedAt: json['deleted_at'] as String?,
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

DealUnit _$DealUnitFromJson(Map<String, dynamic> json) => DealUnit(
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
      deletedAt: json['deleted_at'] as String?,
      downPaymentPlan: json['down_payment_plan'] == null
          ? null
          : DownPaymentPlan.fromJson(
              json['down_payment_plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DealUnitToJson(DealUnit instance) => <String, dynamic>{
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
      'down_payment_plan': instance.downPaymentPlan,
    };

DownPaymentPlan _$DownPaymentPlanFromJson(Map<String, dynamic> json) =>
    DownPaymentPlan(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      paymentPlanId: (json['payment_plan_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DownPaymentPlanToJson(DownPaymentPlan instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'project_id': instance.projectId,
      'unit_id': instance.unitId,
      'payment_plan_id': instance.paymentPlanId,
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
