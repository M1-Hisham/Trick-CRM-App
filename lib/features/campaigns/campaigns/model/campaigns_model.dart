import 'package:json_annotation/json_annotation.dart';

part 'campaigns_model.g.dart';

@JsonSerializable()
class CampaignsModel {
  String? status;
  String? message;
  List<Users>? users;
  List<Campaigns>? campaigns;

  CampaignsModel({this.status, this.message, this.users, this.campaigns});

  factory CampaignsModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignsModelFromJson(json);
}

@JsonSerializable()
class Users {
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

  Users(
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
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'is_deleted')
  int? isDeleted;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Campaigns(
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
  factory Campaigns.fromJson(Map<String, dynamic> json) =>
      _$CampaignsFromJson(json);
}
