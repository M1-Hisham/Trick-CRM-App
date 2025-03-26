// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_campaign_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCampaignRequestBody _$CreateCampaignRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateCampaignRequestBody(
      campaignOwnerId: (json['campaign_owner_id'] as num).toInt(),
      campaignName: json['campaign_name'] as String,
      type: json['type'] as String?,
      status: json['status'] as String?,
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
      expectedRevenue: (json['expected_revenue'] as num?)?.toInt(),
      budgetCost: (json['budget_cost'] as num?)?.toInt(),
      actualCost: (json['actual_cost'] as num?)?.toInt(),
      expectedResponse: json['expected_response'] as String?,
      numbersSent: (json['numbers_sent'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateCampaignRequestBodyToJson(
        CreateCampaignRequestBody instance) =>
    <String, dynamic>{
      'campaign_owner_id': instance.campaignOwnerId,
      'campaign_name': instance.campaignName,
      'type': instance.type,
      'status': instance.status,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'expected_revenue': instance.expectedRevenue,
      'budget_cost': instance.budgetCost,
      'actual_cost': instance.actualCost,
      'expected_response': instance.expectedResponse,
      'numbers_sent': instance.numbersSent,
      'description': instance.description,
    };
