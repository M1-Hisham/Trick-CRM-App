import 'package:json_annotation/json_annotation.dart';

part 'campaign_leads_model.g.dart';

@JsonSerializable()
class CampaignLeadsModel {
  int? id;
  String? tenantId;
  int? campaignId;
  int? leadId;
  String? status;
  int? isDeleted;
  String? createdAt;
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
  int? campaignOwnerId;
  String? campaignOwner;
  String? tenantId;
  String? createdBy;
  String? type;
  String? campaignName;
  String? status;
  String? startDate;
  String? endDate;
  int? expectedRevenue;
  int? budgetCost;
  int? actualCost;
  String? expectedResponse;
  String? numbersSent;
  String? description;
  int? isDeleted;
  String? createdAt;
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
