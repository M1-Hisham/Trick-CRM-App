import 'package:json_annotation/json_annotation.dart';

part 'create_deal_model.g.dart';

@JsonSerializable()
class CreateDealModel {
  String? status;
  String? message;
  Deal? deal;
  CreateDealModel({
    this.status,
    this.message,
    this.deal,
  });
  factory CreateDealModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDealModelFromJson(json);
}

@JsonSerializable()
class Deal {
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'deal_owner_id')
  String? dealOwnerId;
  @JsonKey(name: 'deal_name')
  String? dealName;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'broker_id')
  dynamic brokerId;
  @JsonKey(name: 'lead_source')
  dynamic leadSource;
  int? amount;
  @JsonKey(name: 'campaign_id')
  dynamic campaignId;
  dynamic description;
  @JsonKey(name: 'closing_date')
  String? closingDate;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'unit_id')
  int? unitId;
  @JsonKey(name: 'down_payment_id')
  int? downPaymentId;
  @JsonKey(name: 'down_payment')
  dynamic downPayment;
  dynamic area;
  @JsonKey(name: 'installment_years')
  int? installmentYears;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  int? id;

  Deal({
    this.tenantId,
    this.dealOwnerId,
    this.dealName,
    this.clientId,
    this.brokerId,
    this.leadSource,
    this.amount,
    this.campaignId,
    this.description,
    this.closingDate,
    this.createdBy,
    this.projectId,
    this.unitId,
    this.downPaymentId,
    this.downPayment,
    this.area,
    this.installmentYears,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => _$DealFromJson(json);
}
