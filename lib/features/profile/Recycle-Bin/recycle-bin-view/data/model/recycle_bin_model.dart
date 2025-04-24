import 'package:json_annotation/json_annotation.dart';

part 'recycle_bin_model.g.dart';

@JsonSerializable()
class RecycleBinModel {
  String? status;
  String? message;
  List<TrashedLeads>? trashedLeads;
  List<TrashedClients>? trashedClients;
  List<TrashedContacts>? trashedContacts;
  List<TrashedProjects>? trashedProjects;
  List<TrashedProjectUnits>? trashedProjectUnits;

  RecycleBinModel(
      {this.status,
      this.message,
      this.trashedLeads,
      this.trashedClients,
      this.trashedContacts,
      this.trashedProjects,
      this.trashedProjectUnits});

  factory RecycleBinModel.fromJson(Map<String, dynamic> json) =>
      _$RecycleBinModelFromJson(json);
}

@JsonSerializable()
class TrashedLeads {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'compaing_id')
  int? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
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
  @JsonKey(name: 'fb_lead_id')
  int? fbLeadId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_campaign_name')
  String? fbCampaignName;
  @JsonKey(name: 'converted_deal_id')
  int? convertedDealId;
  @JsonKey(name: 'converted_client_id')
  int? convertedClientId;
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
  Assigned? assigned;

  TrashedLeads(
      {this.id,
      this.userId,
      this.assignedToId,
      this.tenantId,
      this.compaingId,
      this.saluation,
      this.ownerName,
      this.firstName,
      this.lastName,
      this.leadName,
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
      this.fbLeadId,
      this.fbAdName,
      this.fbCampaignName,
      this.convertedDealId,
      this.convertedClientId,
      this.isConverted,
      this.endTime,
      this.endTimeHour,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.assigned});
  factory TrashedLeads.fromJson(Map<String, dynamic> json) =>
      _$TrashedLeadsFromJson(json);
}

@JsonSerializable()
class Assigned {
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

  Assigned(
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
  factory Assigned.fromJson(Map<String, dynamic> json) =>
      _$AssignedFromJson(json);
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
class TrashedClients {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'campaing_id')
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
  int? company;
  @JsonKey(name: 'job_title')
  int? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  int? mobile2;
  int? website;
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

  TrashedClients(
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

  factory TrashedClients.fromJson(Map<String, dynamic> json) =>
      _$TrashedClientsFromJson(json);
}

@JsonSerializable()
class TrashedContacts {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'compaing_id')
  int? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'contact_name')
  String? contactName;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  String? website;
  String? rating;
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
  @JsonKey(name: 'converted_client_id')
  int? convertedClientId;
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

  TrashedContacts(
      {this.id,
      this.userId,
      this.tenantId,
      this.assignedToId,
      this.compaingId,
      this.saluation,
      this.ownerName,
      this.firstName,
      this.lastName,
      this.contactName,
      this.company,
      this.jobTitle,
      this.email,
      this.mobile,
      this.mobile2,
      this.website,
      this.rating,
      this.leadSource,
      this.industry,
      this.annualRevenue,
      this.image,
      this.country,
      this.city,
      this.state,
      this.description,
      this.convertedDealId,
      this.convertedClientId,
      this.isConverted,
      this.endTime,
      this.endTimeHour,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  factory TrashedContacts.fromJson(Map<String, dynamic> json) =>
      _$TrashedContactsFromJson(json);
}

@JsonSerializable()
class TrashedProjects {
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
  String? deletedAt;
  @JsonKey(name: 'project_units')
  List<dynamic>? projectUnits;
  @JsonKey(name: 'project_down_payments')
  List<dynamic>? projectDownPayments;

  TrashedProjects(
      {this.id,
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
      this.projectDownPayments});

  factory TrashedProjects.fromJson(Map<String, dynamic> json) =>
      _$TrashedProjectsFromJson(json);
}

@JsonSerializable()
class TrashedProjectUnits {
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

  TrashedProjectUnits(
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

  factory TrashedProjectUnits.fromJson(Map<String, dynamic> json) =>
      _$TrashedProjectUnitsFromJson(json);
}
