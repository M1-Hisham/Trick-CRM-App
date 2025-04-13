import 'package:json_annotation/json_annotation.dart';

part 'lead_campaign_view_model.g.dart';

@JsonSerializable()
class LeadCampaignViewModel {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'campaign_id')
  int? campaignId;
  @JsonKey(name: 'lead_id')
  int? leadId;
  String? status;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Lead? lead;
  Campaign? campaign;

  LeadCampaignViewModel(
      {this.id,
      this.tenantId,
      this.campaignId,
      this.leadId,
      this.status,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.lead,
      this.campaign});
  factory LeadCampaignViewModel.fromJson(Map<String, dynamic> json) =>
      _$LeadCampaignViewModelFromJson(json);
}

@JsonSerializable()
class Lead {
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
  String? fbLeadId;
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

  Lead({
    this.id,
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
    this.assigned,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);
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
