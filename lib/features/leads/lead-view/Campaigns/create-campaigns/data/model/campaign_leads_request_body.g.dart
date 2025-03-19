// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'campaign_leads_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CampaignLeadsRequestBody _$CampaignLeadsRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CampaignLeadsRequestBody(
      campaignId: (json['campaign_id'] as num).toInt(),
      status: json['status'] as String,
    );

Map<String, dynamic> _$CampaignLeadsRequestBodyToJson(
        CampaignLeadsRequestBody instance) =>
    <String, dynamic>{
      'campaign_id': instance.campaignId,
      'status': instance.status,
    };
