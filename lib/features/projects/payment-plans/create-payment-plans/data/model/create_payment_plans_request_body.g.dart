// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_plans_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentPlansRequestBody _$CreatePaymentPlansRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentPlansRequestBody(
      downPaymentPercentage: (json['down_payment_percentage'] as num).toInt(),
      years: (json['years'] as num).toInt(),
      discount: (json['discount'] as num).toInt(),
    );

Map<String, dynamic> _$CreatePaymentPlansRequestBodyToJson(
        CreatePaymentPlansRequestBody instance) =>
    <String, dynamic>{
      'down_payment_percentage': instance.downPaymentPercentage,
      'years': instance.years,
      'discount': instance.discount,
    };
