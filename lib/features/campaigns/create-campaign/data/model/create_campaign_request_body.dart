import 'package:json_annotation/json_annotation.dart';

part 'create_campaign_request_body.g.dart';

@JsonSerializable()
class CreateCampaignRequestBody {
  @JsonKey(name: 'campaign_owner_id')
  int campaignOwnerId;
  @JsonKey(name: 'campaign_name')
  String campaignName;
  String? type;
  String? status;
  @JsonKey(name: 'start_date')
  String? startDate;
  @JsonKey(name: 'end_date')
  String? endDate;
  @JsonKey(name: 'expected_revenue')
  int? expectedRevenue;
  @JsonKey(name: 'budget_cost')
  int? budgetCost;
  @JsonKey(name: 'actual_cost')
  int? actualCost;
  @JsonKey(name: 'expected_response')
  String? expectedResponse;
  @JsonKey(name: 'numbers_sent')
  int? numbersSent;
  String? description;
  CreateCampaignRequestBody({
    required this.campaignOwnerId,
    required this.campaignName,
    this.type,
    this.status,
    this.startDate,
    this.endDate,
    this.expectedRevenue,
    this.budgetCost,
    this.actualCost,
    this.expectedResponse,
    this.numbersSent,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateCampaignRequestBodyToJson(this);
}
