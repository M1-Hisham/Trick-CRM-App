import 'package:json_annotation/json_annotation.dart';

part 'create_payment_plans_model.g.dart';

@JsonSerializable()
class CreatePaymentPlansModel {
  final String? status;
  final String? message;
  CreatePaymentPlansModel({
    this.status,
    this.message,
  });

  factory CreatePaymentPlansModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePaymentPlansModelFromJson(json);
}
