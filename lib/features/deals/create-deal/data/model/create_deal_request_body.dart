import 'package:json_annotation/json_annotation.dart';

part 'create_deal_request_body.g.dart';

@JsonSerializable()
class CreateDealRequestBody {
  @JsonKey(name: 'deal_owner_id')
  String dealOwnerId;
  @JsonKey(name: 'deal_name')
  String dealName;
  @JsonKey(name: 'client_id')
  int clientId;
  int amount;
  @JsonKey(name: 'project_id')
  int projectId;
  @JsonKey(name: 'unit_id')
  int unitId;
  @JsonKey(name: 'down_payment_id')
  int downPaymentId;
  int years;
  @JsonKey(name: 'reservation_status')
  String reservationStatus;
  @JsonKey(name: 'down_payment')
  int? downPayment;
  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'unit_area')
  double? unitArea;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  @JsonKey(name: 'campaign_id')
  int? campaignId;
  @JsonKey(name: 'closing_date')
  String? closingDate;
  String? description;

  CreateDealRequestBody({
    required this.dealOwnerId,
    required this.dealName,
    required this.clientId,
    required this.amount,
    required this.projectId,
    required this.unitId,
    required this.downPaymentId,
    required this.years,
    required this.reservationStatus,
    this.downPayment,
    this.brokerId,
    this.unitArea,
    this.leadSource,
    this.campaignId,
    this.closingDate,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateDealRequestBodyToJson(this);
}
