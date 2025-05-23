import 'package:json_annotation/json_annotation.dart';
import 'package:trick_crm_app/features/campaigns/campaign-view/Campaign-Leads/leads-view/data/model/lead_campaign_view_model.dart';

import '../../../Attatchments/attachment-view/model/campaign_attatchments_model.dart';
import '../../../Timeline/data/model/campaign_activity_log_model.dart';
import '../../../notes/notes-view/model/campaign_notes_model.dart';

part 'campaign_view_model.g.dart';

@JsonSerializable()
class CampaignViewModel {
  String? status;
  String? message;
  Campaign? campaign;
  List<CampaignNotesModel>? campaignNotes;
  List<LeadCampaignViewModel>? campaignLeads;
  List<Lead>? leads;
  List<CampaignAttatchmentsModel>? campaignAttachments;
  @JsonKey(name: 'activity_log')
  List<CampaignActivityLogModel>? activityLog;

  CampaignViewModel({
    this.status,
    this.message,
    this.campaign,
    this.campaignNotes,
    this.campaignLeads,
    this.leads,
    this.campaignAttachments,
    this.activityLog,
  });

  factory CampaignViewModel.fromJson(Map<String, dynamic> json) =>
      _$CampaignViewModelFromJson(json);
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
