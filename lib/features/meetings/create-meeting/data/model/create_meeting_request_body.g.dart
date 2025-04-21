// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_meeting_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateMeetingRequestBody _$CreateMeetingRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateMeetingRequestBody(
      title: json['title'] as String,
      location: json['location'] as String,
      hostId: (json['host_id'] as num).toInt(),
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'] as String?,
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      relatedTo: json['related_to'] as String?,
      relatedToClient: json['related_to_client'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: (json['contact_id'] as num?)?.toInt(),
      clientId: (json['client_id'] as num?)?.toInt(),
      dealId: (json['deal_id'] as num?)?.toInt(),
      compaignId: (json['compaign_id'] as num?)?.toInt(),
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateMeetingRequestBodyToJson(
        CreateMeetingRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location': instance.location,
      'host_id': instance.hostId,
      'participants': instance.participants,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'deal_id': instance.dealId,
      'compaign_id': instance.compaignId,
      'description': instance.description,
    };
