// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentPlansModel _$CreatePaymentPlansModelFromJson(
        Map<String, dynamic> json) =>
    CreatePaymentPlansModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreatePaymentPlansModelToJson(
        CreatePaymentPlansModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
