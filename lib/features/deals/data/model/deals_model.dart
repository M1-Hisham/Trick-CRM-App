import 'package:json_annotation/json_annotation.dart';

part 'deals_model.g.dart';

@JsonSerializable()
class DealsModel {
  String? status;
  String? message;
  List<Deals>? deals;
  List<Users>? users;
  List<Clients>? clients;
  List<Campaigns>? campaigns;
  List<Projects>? projects;
  List<Brokers>? brokers;

  DealsModel({
    this.status,
    this.message,
    this.deals,
    this.users,
    this.clients,
    this.campaigns,
    this.projects,
    this.brokers,
  });
  factory DealsModel.fromJson(Map<String, dynamic> json) =>
      _$DealsModelFromJson(json);
}

@JsonSerializable()
class Deals {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'deal_owner_id')
  int? dealOwnerId;
  @JsonKey(name: 'broker_id')
  dynamic brokerId;
  @JsonKey(name: 'deal_name')
  String? dealName;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? amount;
  @JsonKey(name: 'campaign_id')
  dynamic campaignId;
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
  dynamic area;
  @JsonKey(name: 'installment_years')
  int? installmentYears;
  @JsonKey(name: 'down_payment')
  dynamic downPayment;
  String? status;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Client? client;
  Owner? owner;
  dynamic campaign;

  Deals({
    this.id,
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
  });
  factory Deals.fromJson(Map<String, dynamic> json) => _$DealsFromJson(json);
}

@JsonSerializable()
class Users {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;
  @JsonKey(name: 'department_id')
  int? departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Department? department;

  Users({
    this.id,
    this.name,
    this.email,
    this.tenantId,
    this.emailVerifiedAt,
    this.departmentId,
    this.companyId,
    this.avatar,
    this.roleAs,
    this.isTenant,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.department,
  });
  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
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
class Client {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'broker_id')
  dynamic brokerId;
  @JsonKey(name: 'campaing_id')
  dynamic campaingId;
  dynamic saluation;
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
  dynamic website;
  dynamic rating;
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
  dynamic convertedDealId;
  @JsonKey(name: 'converted_contact_id')
  dynamic convertedContactId;
  @JsonKey(name: 'converted_lead_id')
  int? convertedLeadId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
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

  Client({
    this.id,
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
    this.address,
  });

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@JsonSerializable()
class Owner {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  int? departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Department? department;

  Owner({
    this.id,
    this.name,
    this.email,
    this.tenantId,
    this.emailVerifiedAt,
    this.departmentId,
    this.companyId,
    this.avatar,
    this.roleAs,
    this.isTenant,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.department,
  });

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}

@JsonSerializable()
class Clients {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'broker_id')
  dynamic brokerId;
  @JsonKey(name: 'campaing_id')
  dynamic campaingId;
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
  dynamic website;
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
  dynamic convertedDealId;
  @JsonKey(name: 'converted_contact_id')
  dynamic convertedContactId;
  @JsonKey(name: 'converted_lead_id')
  int? convertedLeadId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
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

  Clients({
    this.id,
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
    this.address,
  });

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@JsonSerializable()
class Campaigns {
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

  Campaigns({
    this.id,
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
    this.updatedAt,
  });

  factory Campaigns.fromJson(Map<String, dynamic> json) =>
      _$CampaignsFromJson(json);
}

@JsonSerializable()
class Projects {
  int? id;

  @JsonKey(name: 'tenant_id')
  String? tenantId;

  @JsonKey(name: 'user_id')
  int? userId;

  @JsonKey(name: 'created_by')
  String? createdBy;

  String? name;
  String? size;
  String? location;
  String? description;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  @JsonKey(name: 'project_units')
  List<ProjectUnits>? projectUnits;

  @JsonKey(name: 'project_down_payments')
  List<ProjectDownPayments>? projectDownPayments;

  Projects({
    this.id,
    this.tenantId,
    this.userId,
    this.createdBy,
    this.name,
    this.size,
    this.location,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.projectUnits,
    this.projectDownPayments,
  });

  factory Projects.fromJson(Map<String, dynamic> json) =>
      _$ProjectsFromJson(json);
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
  dynamic deletedAt;

  ProjectUnits({
    this.id,
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
    this.deletedAt,
  });

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
  dynamic deletedAt;

  @JsonKey(name: 'down_payment')
  DownPayment? downPayment;

  ProjectDownPayments({
    this.id,
    this.tenantId,
    this.projectId,
    this.downPaymentId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.downPayment,
  });

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

  DownPayment({
    this.id,
    this.tenantId,
    this.userId,
    this.createdBy,
    this.planName,
    this.downPaymentPercentage,
    this.years,
    this.discount,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory DownPayment.fromJson(Map<String, dynamic> json) =>
      _$DownPaymentFromJson(json);
}

@JsonSerializable()
class Brokers {
  int? id;

  @JsonKey(name: 'tenant_id')
  String? tenantId;

  @JsonKey(name: 'owner_id')
  int? ownerId;

  String? email;

  @JsonKey(name: 'company_name')
  String? companyName;

  @JsonKey(name: 'commercial_register')
  String? commercialRegister;

  @JsonKey(name: 'tax_card')
  String? taxCard;

  String? address;

  @JsonKey(name: 'person_name')
  String? personName;

  String? mobile;

  @JsonKey(name: 'mobile_2')
  String? mobile2;

  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;

  @JsonKey(name: 'is_active')
  int? isActive;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Brokers({
    this.id,
    this.tenantId,
    this.ownerId,
    this.email,
    this.companyName,
    this.commercialRegister,
    this.taxCard,
    this.address,
    this.personName,
    this.mobile,
    this.mobile2,
    this.assignedToId,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory Brokers.fromJson(Map<String, dynamic> json) =>
      _$BrokersFromJson(json);
}
