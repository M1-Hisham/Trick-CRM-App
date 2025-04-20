import 'package:json_annotation/json_annotation.dart';

part 'deals_closing_this_month_model.g.dart';

@JsonSerializable()
class DealsClosingThisMonthModel {
  List<Data>? data;

  DealsClosingThisMonthModel({this.data});
  factory DealsClosingThisMonthModel.fromJson(Map<String, dynamic> json) =>
      _$DealsClosingThisMonthModelFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'deal_name')
  String? dealName;
  String? amount;
  @JsonKey(name: 'closing_date')
  String? closingDate;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'created_at_formated')
  String? createdAtFormated;
  Client? client;
  Owner? owner;
  Campaign? campaign;

  Data(
      {this.dealName,
      this.amount,
      this.closingDate,
      this.createdBy,
      this.clientId,
      this.createdAtFormated,
      this.client,
      this.owner,
      this.campaign});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
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

  Owner(
      {this.id,
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
      this.department});

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
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

  Campaign({
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
  factory Campaign.fromJson(Map<String, dynamic> json) =>
      _$CampaignFromJson(json);
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
