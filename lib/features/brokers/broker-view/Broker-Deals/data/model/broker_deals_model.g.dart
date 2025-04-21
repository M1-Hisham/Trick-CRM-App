// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broker_deals_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrokerDealsModel _$BrokerDealsModelFromJson(Map<String, dynamic> json) =>
    BrokerDealsModel(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      dealOwnerId: (json['deal_owner_id'] as num?)?.toInt(),
      brokerId: (json['broker_id'] as num?)?.toInt(),
      dealName: json['deal_name'] as String?,
      clientId: (json['client_id'] as num?)?.toInt(),
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
          : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      unit: json['unit'] == null
          ? null
          : Unit.fromJson(json['unit'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BrokerDealsModelToJson(BrokerDealsModel instance) =>
    <String, dynamic>{
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
      'project': instance.project,
      'unit': instance.unit,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      assignedToId: (json['assigned_to'] as num?)?.toInt(),
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
      'assigned_to': instance.assignedToId,
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

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      projectUnits: (json['project_units'] as List<dynamic>?)
          ?.map((e) => ProjectUnits.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectDownPayments: (json['project_down_payments'] as List<dynamic>?)
          ?.map((e) => ProjectDownPayments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
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
      downPayment: json['downPayment'] == null
          ? null
          : DownPayment.fromJson(json['downPayment'] as Map<String, dynamic>),
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
      'downPayment': instance.downPayment,
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

Unit _$UnitFromJson(Map<String, dynamic> json) => Unit(
      id: (json['id'] as num?)?.toInt(),
      unitCode: json['unit_code'] as String?,
    );

Map<String, dynamic> _$UnitToJson(Unit instance) => <String, dynamic>{
      'id': instance.id,
      'unit_code': instance.unitCode,
    };
