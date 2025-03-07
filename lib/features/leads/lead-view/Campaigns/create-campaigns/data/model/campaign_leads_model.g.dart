// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_leads_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignLeadsModel _$CampaignLeadsModelFromJson(Map<String, dynamic> json) =>
    CampaignLeadsModel(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenantId'] as String?,
      campaignId: (json['campaignId'] as num?)?.toInt(),
      leadId: (json['leadId'] as num?)?.toInt(),
      status: json['status'] as String?,
      isDeleted: (json['isDeleted'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      campaign: json['campaign'] == null
          ? null
          : Campaign.fromJson(json['campaign'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CampaignLeadsModelToJson(CampaignLeadsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenantId': instance.tenantId,
      'campaignId': instance.campaignId,
      'leadId': instance.leadId,
      'status': instance.status,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'campaign': instance.campaign,
    };

Campaign _$CampaignFromJson(Map<String, dynamic> json) => Campaign(
      id: (json['id'] as num?)?.toInt(),
      campaignOwnerId: (json['campaignOwnerId'] as num?)?.toInt(),
      campaignOwner: json['campaignOwner'] as String?,
      tenantId: json['tenantId'] as String?,
      createdBy: json['createdBy'] as String?,
      type: json['type'] as String?,
      campaignName: json['campaignName'] as String?,
      status: json['status'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      expectedRevenue: (json['expectedRevenue'] as num?)?.toInt(),
      budgetCost: (json['budgetCost'] as num?)?.toInt(),
      actualCost: (json['actualCost'] as num?)?.toInt(),
      expectedResponse: json['expectedResponse'] as String?,
      numbersSent: json['numbersSent'] as String?,
      description: json['description'] as String?,
      isDeleted: (json['isDeleted'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$CampaignToJson(Campaign instance) => <String, dynamic>{
      'id': instance.id,
      'campaignOwnerId': instance.campaignOwnerId,
      'campaignOwner': instance.campaignOwner,
      'tenantId': instance.tenantId,
      'createdBy': instance.createdBy,
      'type': instance.type,
      'campaignName': instance.campaignName,
      'status': instance.status,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'expectedRevenue': instance.expectedRevenue,
      'budgetCost': instance.budgetCost,
      'actualCost': instance.actualCost,
      'expectedResponse': instance.expectedResponse,
      'numbersSent': instance.numbersSent,
      'description': instance.description,
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
