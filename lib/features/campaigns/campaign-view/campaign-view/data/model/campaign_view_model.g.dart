// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_view_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignViewModel _$CampaignViewModelFromJson(Map<String, dynamic> json) =>
    CampaignViewModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      campaign: json['campaign'] == null
          ? null
          : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
      campaignNotes: (json['campaignNotes'] as List<dynamic>?)
          ?.map((e) => CampaignNotesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      campaignLeads: (json['campaignLeads'] as List<dynamic>?)
          ?.map(
              (e) => LeadCampaignViewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      leads: (json['leads'] as List<dynamic>?)
          ?.map((e) => Lead.fromJson(e as Map<String, dynamic>))
          .toList(),
      campaignAttachments: (json['campaignAttachments'] as List<dynamic>?)
          ?.map((e) =>
              CampaignAttatchmentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      activityLog: (json['activity_log'] as List<dynamic>?)
          ?.map((e) =>
              CampaignActivityLogModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CampaignViewModelToJson(CampaignViewModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'campaign': instance.campaign,
      'campaignNotes': instance.campaignNotes,
      'campaignLeads': instance.campaignLeads,
      'leads': instance.leads,
      'campaignAttachments': instance.campaignAttachments,
      'activity_log': instance.activityLog,
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
