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
      hostId: (json['hostId'] as num).toInt(),
    );

Map<String, dynamic> _$CreateMeetingRequestBodyToJson(
        CreateMeetingRequestBody instance) =>
    <String, dynamic>{
      'title': instance.title,
      'location': instance.location,
      'hostId': instance.hostId,
    };
