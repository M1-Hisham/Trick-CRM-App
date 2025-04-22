// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    SubscriptionModel(
      subscription: json['subscription'] == null
          ? null
          : Subscription.fromJson(json['subscription'] as Map<String, dynamic>),
      userBalance: (json['userBalance'] as num?)?.toInt(),
      userFeatures: (json['userFeatures'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$SubscriptionModelToJson(SubscriptionModel instance) =>
    <String, dynamic>{
      'subscription': instance.subscription,
      'userBalance': instance.userBalance,
      'userFeatures': instance.userFeatures,
    };

Subscription _$SubscriptionFromJson(Map<String, dynamic> json) => Subscription(
      id: (json['id'] as num?)?.toInt(),
      planId: (json['plan_id'] as num?)?.toInt(),
      canceledAt: json['canceled_at'] as String?,
      expiredAt: json['expired_at'] as String?,
      graceDaysEndedAt: json['grace_days_ended_at'] as String?,
      startedAt: json['started_at'] as String?,
      suppressedAt: json['suppressed_at'] as String?,
      wasSwitched: (json['was_switched'] as num?)?.toInt(),
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      subscriberType: json['subscriber_type'] as String?,
      subscriberId: json['subscriber_id'] as String?,
      plan: json['plan'] == null
          ? null
          : Plan.fromJson(json['plan'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionToJson(Subscription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'plan_id': instance.planId,
      'canceled_at': instance.canceledAt,
      'expired_at': instance.expiredAt,
      'grace_days_ended_at': instance.graceDaysEndedAt,
      'started_at': instance.startedAt,
      'suppressed_at': instance.suppressedAt,
      'was_switched': instance.wasSwitched,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'subscriber_type': instance.subscriberType,
      'subscriber_id': instance.subscriberId,
      'plan': instance.plan,
    };

Plan _$PlanFromJson(Map<String, dynamic> json) => Plan(
      id: (json['id'] as num?)?.toInt(),
      graceDays: (json['grace_days'] as num?)?.toInt(),
      name: json['name'] as String?,
      periodicity: (json['periodicity'] as num?)?.toInt(),
      periodicityType: json['periodicity_type'] as String?,
      deletedAt: json['deleted_at'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$PlanToJson(Plan instance) => <String, dynamic>{
      'id': instance.id,
      'grace_days': instance.graceDays,
      'name': instance.name,
      'periodicity': instance.periodicity,
      'periodicity_type': instance.periodicityType,
      'deleted_at': instance.deletedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
