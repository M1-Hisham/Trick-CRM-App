import 'package:json_annotation/json_annotation.dart';

part 'create_meeting_request_body.g.dart';

@JsonSerializable()
class CreateMeetingRequestBody {
  String title;
  String location;
  @JsonKey(name: 'host_id')
  int hostId;
  List<String> participants;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'start_time_hour')
  String? startTimeHour;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'related_to')
  String? relatedTo;
  @JsonKey(name: 'related_to_client')
  String? relatedToClient;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  int? contactId;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'deal_id')
  int? dealId;
  @JsonKey(name: 'compaign_id')
  int? compaignId;
  String? description;
  CreateMeetingRequestBody({
    required this.title,
    required this.location,
    required this.hostId,
    required this.participants,
    this.startTime,
    this.startTimeHour,
    this.endTime,
    this.endTimeHour,
    this.relatedTo,
    this.relatedToClient,
    this.leadId,
    this.contactId,
    this.clientId,
    this.dealId,
    this.compaignId,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateMeetingRequestBodyToJson(this);
}
