import 'package:json_annotation/json_annotation.dart';

part 'broker_deals_model.g.dart';

@JsonSerializable()
class BrokerDealsModel {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'deal_owner_id')
  int? dealOwnerId;
  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'deal_name')
  String? dealName;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? amount;
  @JsonKey(name: 'campaign_id')
  int? campaignId;
  String? description;
  @JsonKey(name: 'closing_date')
  String? closingDate;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'unit_id')
  int? unitId;
  @JsonKey(name: 'down_payment_id')
  int? downPaymentId;
  String? area;
  @JsonKey(name: 'installment_years')
  int? installmentYears;
  @JsonKey(name: 'down_payment')
  int? downPayment;
  String? status;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Client? client;
  Owner? owner;
  Campaign? campaign;
  Project? project;
  Unit? unit;

  BrokerDealsModel(
      {this.id,
      this.tenantId,
      this.dealOwnerId,
      this.brokerId,
      this.dealName,
      this.clientId,
      this.leadSource,
      this.amount,
      this.campaignId,
      this.description,
      this.closingDate,
      this.createdBy,
      this.projectId,
      this.unitId,
      this.downPaymentId,
      this.area,
      this.installmentYears,
      this.downPayment,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.client,
      this.owner,
      this.campaign,
      this.project,
      this.unit});

  factory BrokerDealsModel.fromJson(Map<String, dynamic> json) =>
      _$BrokerDealsModelFromJson(json);
}

@JsonSerializable()
class Client {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to')
  int? assignedToId;
  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'campaign_id')
  int? campaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'client_name')
  String? clientName;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  String? website;
  String? rating;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? industry;
  @JsonKey(name: 'annual_revenue')
  int? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  @JsonKey(name: 'converted_deal_id')
  int? convertedDealId;
  @JsonKey(name: 'converted_contact_id')
  int? convertedContactId;
  @JsonKey(name: 'converted_lead_id')
  int? convertedLeadId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'ar_name')
  String? arName;
  @JsonKey(name: 'national_id')
  String? nationalId;
  @JsonKey(name: 'passport_id')
  String? passportId;
  String? nationality;
  String? address;

  Client(
      {this.id,
      this.userId,
      this.tenantId,
      this.assignedToId,
      this.brokerId,
      this.campaingId,
      this.saluation,
      this.ownerName,
      this.firstName,
      this.lastName,
      this.clientName,
      this.company,
      this.jobTitle,
      this.email,
      this.mobile,
      this.mobile2,
      this.website,
      this.rating,
      this.leadStatus,
      this.leadSource,
      this.industry,
      this.annualRevenue,
      this.image,
      this.country,
      this.city,
      this.state,
      this.description,
      this.convertedDealId,
      this.convertedContactId,
      this.convertedLeadId,
      this.isConverted,
      this.endTime,
      this.endTimeHour,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.arName,
      this.nationalId,
      this.passportId,
      this.nationality,
      this.address});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@JsonSerializable()
class Campaign {
  int? id;
  @JsonKey(name: 'campaign_owner_id')
  int? campaignOwnerId;
  @JsonKey(name: 'campaign_owner')
  String? campaignOwner;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  String? type;
  @JsonKey(name: 'campaign_name')
  String? campaignName;
  String? status;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  @JsonKey(name: 'expected_revenue')
  int? expectedRevenue;
  @JsonKey(name: 'budget_cost')
  int? budgetCost;
  @JsonKey(name: 'actual_cost')
  int? actualCost;
  @JsonKey(name: 'expected_response')
  String? expectedResponse;
  @JsonKey(name: 'numbers_sent')
  String? numbersSent;
  String? description;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Campaign(
      {this.id,
      this.campaignOwnerId,
      this.campaignOwner,
      this.tenantId,
      this.createdBy,
      this.type,
      this.campaignName,
      this.status,
      this.startDate,
      this.endDate,
      this.expectedRevenue,
      this.budgetCost,
      this.actualCost,
      this.expectedResponse,
      this.numbersSent,
      this.description,
      this.isDeleted,
      this.createdAt,
      this.updatedAt});
  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
}

@JsonSerializable()
class Owner {
  int? id;
  String? name;
  Department? department;

  Owner({this.id, this.name, this.department});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@JsonSerializable()
class Department {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Department(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@JsonSerializable()
class Project {
  int? id;
  String? name;
  @JsonKey(name: 'project_units')
  List<ProjectUnits>? projectUnits;
  @JsonKey(name: 'project_down_payments')
  List<ProjectDownPayments>? projectDownPayments;

  Project({this.id, this.name, this.projectUnits, this.projectDownPayments});

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@JsonSerializable()
class ProjectUnits {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'sales_id')
  int? salesId;
  @JsonKey(name: 'unit_type')
  String? unitType;
  @JsonKey(name: 'unit_code')
  String? unitCode;
  @JsonKey(name: 'unit_number')
  String? unitNumber;
  @JsonKey(name: 'building_code')
  String? buildingCode;
  @JsonKey(name: 'building_number')
  String? buildingNumber;
  @JsonKey(name: 'garden_area')
  String? gardenArea;
  @JsonKey(name: 'roof_area')
  String? roofArea;
  @JsonKey(name: 'garage_price')
  String? garagePrice;
  @JsonKey(name: 'meter_price')
  String? meterPrice;
  @JsonKey(name: 'unit_area')
  String? unitArea;
  @JsonKey(name: 'total_price')
  String? totalPrice;
  dynamic floor;
  String? status;
  @JsonKey(name: 'reservation_status')
  String? reservationStatus;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;

  ProjectUnits(
      {this.id,
      this.tenantId,
      this.userId,
      this.projectId,
      this.salesId,
      this.unitType,
      this.unitCode,
      this.unitNumber,
      this.buildingCode,
      this.buildingNumber,
      this.gardenArea,
      this.roofArea,
      this.garagePrice,
      this.meterPrice,
      this.unitArea,
      this.totalPrice,
      this.floor,
      this.status,
      this.reservationStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory ProjectUnits.fromJson(Map<String, dynamic> json) =>
      _$ProjectUnitsFromJson(json);
}

@JsonSerializable()
class ProjectDownPayments {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'down_payment_id')
  int? downPaymentId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  DownPayment? downPayment;

  ProjectDownPayments(
      {this.id,
      this.tenantId,
      this.projectId,
      this.downPaymentId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.downPayment});
  factory ProjectDownPayments.fromJson(Map<String, dynamic> json) =>
      _$ProjectDownPaymentsFromJson(json);
}

@JsonSerializable()
class DownPayment {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'down_payment_percentage')
  int? downPaymentPercentage;
  int? years;
  String? discount;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  DownPayment(
      {this.id,
      this.tenantId,
      this.userId,
      this.createdBy,
      this.planName,
      this.downPaymentPercentage,
      this.years,
      this.discount,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory DownPayment.fromJson(Map<String, dynamic> json) =>
      _$DownPaymentFromJson(json);
}

@JsonSerializable()
class Unit {
  int? id;
  @JsonKey(name: 'unit_code')
  String? unitCode;

  Unit({this.id, this.unitCode});

  factory Unit.fromJson(Map<String, dynamic> json) => _$UnitFromJson(json);
}
