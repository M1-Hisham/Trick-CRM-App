import 'package:json_annotation/json_annotation.dart';

part 'campaign_leads_request_body.g.dart';

@JsonSerializable()
class CampaignLeadsRequestBody {
  @JsonKey(name: 'campaign_id')
  int campaignId;
  String status;
  CampaignLeadsRequestBody({
    required this.campaignId,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$CampaignLeadsRequestBodyToJson(this);
}
