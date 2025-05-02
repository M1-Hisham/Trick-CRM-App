import 'package:json_annotation/json_annotation.dart';

part 'create_call_request_body.g.dart';

@JsonSerializable()
class CreateCallRequestBody {
  String subject;
  @JsonKey(name: 'owner_id')
  int ownerId;
  @JsonKey(name: 'call_to')
  String callTo;
  @JsonKey(name: 'call_status')
  String callStatus;

  @JsonKey(name: 'call_type')
  String? callType;
  @JsonKey(name: 'call_purpose')
  String? callPurpose;
  @JsonKey(name: 'call_result')
  String? callResult;
  @JsonKey(name: 'start_time')
  String? startTime;
  @JsonKey(name: 'start_time_hour')
  String? startTimeHour;
  @JsonKey(name: 'related_to_client')
  String? relatedToClient;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'deal_id')
  int? dealId;
  @JsonKey(name: 'campaign_id')
  int? campaignId;
  @JsonKey(name: 'contact_id')
  int? contactId;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'call_agenda')
  String? callAgenda;
  String? description;

  CreateCallRequestBody({
    required this.subject,
    required this.ownerId,
    required this.callTo,
    required this.callStatus,
    this.callType,
    this.callPurpose,
    this.callResult,
    this.startTime,
    this.startTimeHour,
    this.relatedToClient,
    this.leadId,
    this.dealId,
    this.campaignId,
    this.contactId,
    this.clientId,
    this.callAgenda,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateCallRequestBodyToJson(this);
}
