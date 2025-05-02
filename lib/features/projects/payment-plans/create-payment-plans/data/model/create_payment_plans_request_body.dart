import 'package:json_annotation/json_annotation.dart';

part 'create_payment_plans_request_body.g.dart';

@JsonSerializable()
class CreatePaymentPlansRequestBody {
  @JsonKey(name: 'down_payment_percentage')
  int downPaymentPercentage;
  int years;
  int discount;
  CreatePaymentPlansRequestBody({
    required this.downPaymentPercentage,
    required this.years,
    required this.discount,
  });

  Map<String, dynamic> toJson() => _$CreatePaymentPlansRequestBodyToJson(this);
}
