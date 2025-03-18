// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_plans_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentPlansModel _$PaymentPlansModelFromJson(Map<String, dynamic> json) =>
    PaymentPlansModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      paymentPlans: (json['paymentPlans'] as List<dynamic>?)
          ?.map((e) => PaymentPlans.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentPlansModelToJson(PaymentPlansModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'paymentPlans': instance.paymentPlans,
    };

PaymentPlans _$PaymentPlansFromJson(Map<String, dynamic> json) => PaymentPlans(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      planName: json['plan_name'] as String?,
      downPaymentPercentage: (json['down_payment_percentage'] as num?)?.toInt(),
      years: (json['years'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PaymentPlansToJson(PaymentPlans instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'created_by': instance.createdBy,
      'plan_name': instance.planName,
      'down_payment_percentage': instance.downPaymentPercentage,
      'years': instance.years,
      'discount': instance.discount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
