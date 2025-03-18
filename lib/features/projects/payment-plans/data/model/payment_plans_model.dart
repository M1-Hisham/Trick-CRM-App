import 'package:json_annotation/json_annotation.dart';

part 'payment_plans_model.g.dart';

@JsonSerializable()
class PaymentPlansModel {
  String? status;
  String? message;
  List<PaymentPlans>? paymentPlans;

  PaymentPlansModel({this.status, this.message, this.paymentPlans});

  factory PaymentPlansModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentPlansModelFromJson(json);
}

@JsonSerializable()
class PaymentPlans {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'down_payment_percentage')
  int? downPaymentPercentage;
  int? years;
  String? discount;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  PaymentPlans(
      {this.id,
      this.tenantId,
      this.userId,
      this.createdBy,
      this.planName,
      this.downPaymentPercentage,
      this.years,
      this.discount,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory PaymentPlans.fromJson(Map<String, dynamic> json) =>
      _$PaymentPlansFromJson(json);
}

