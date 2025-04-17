import 'package:json_annotation/json_annotation.dart';

part 'campaign_leads_model.g.dart';

@JsonSerializable()
class CampaignLeadsModel {
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
  Campaign? campaign;

  CampaignLeadsModel({
    this.id,
    this.tenantId,
    this.campaignId,
    this.leadId,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.campaign,
  });
  factory CampaignLeadsModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignLeadsModelFromJson(json);
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
