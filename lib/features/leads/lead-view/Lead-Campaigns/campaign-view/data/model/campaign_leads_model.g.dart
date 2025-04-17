// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_leads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignLeadsModel _$CampaignLeadsModelFromJson(Map<String, dynamic> json) =>
    CampaignLeadsModel(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      campaign: json['campaign'] == null
          ? null
          : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CampaignLeadsModelToJson(CampaignLeadsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'campaign_id': instance.campaignId,
      'lead_id': instance.leadId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'campaign': instance.campaign,
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
