// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_call_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateCallRequestBody _$CreateCallRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateCallRequestBody(
      subject: json['subject'] as String,
      ownerId: (json['owner_id'] as num).toInt(),
      callTo: json['call_to'] as String,
      callStatus: json['call_status'] as String,
      callType: json['call_type'] as String?,
      callPurpose: json['call_purpose'] as String?,
      callResult: json['call_result'] as String?,
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'] as String?,
      relatedToClient: json['related_to_client'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      dealId: (json['deal_id'] as num?)?.toInt(),
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      callAgenda: json['call_agenda'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateCallRequestBodyToJson(
        CreateCallRequestBody instance) =>
    <String, dynamic>{
      'subject': instance.subject,
      'owner_id': instance.ownerId,
      'call_to': instance.callTo,
      'call_status': instance.callStatus,
      'call_type': instance.callType,
      'call_purpose': instance.callPurpose,
      'call_result': instance.callResult,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'related_to_client': instance.relatedToClient,
      'lead_id': instance.leadId,
      'deal_id': instance.dealId,
      'campaign_id': instance.campaignId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'call_agenda': instance.callAgenda,
      'description': instance.description,
    };
