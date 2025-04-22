import 'package:json_annotation/json_annotation.dart';

part 'subscription_model.g.dart';

@JsonSerializable()
class SubscriptionModel {
  Subscription? subscription;
  int? userBalance;
  List<Map<String, dynamic>>? userFeatures;

  SubscriptionModel({this.subscription, this.userBalance, this.userFeatures});

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@JsonSerializable()
class Subscription {
  int? id;
  @JsonKey(name: 'plan_id')
  int? planId;
  @JsonKey(name: 'canceled_at')
  String? canceledAt;
  @JsonKey(name: 'expired_at')
  String? expiredAt;
  @JsonKey(name: 'grace_days_ended_at')
  String? graceDaysEndedAt;
  @JsonKey(name: 'started_at')
  String? startedAt;
  @JsonKey(name: 'suppressed_at')
  String? suppressedAt;
  @JsonKey(name: 'was_switched')
  int? wasSwitched;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'subscriber_type')
  String? subscriberType;
  @JsonKey(name: 'subscriber_id')
  String? subscriberId;
  Plan? plan;

  Subscription(
      {this.id,
      this.planId,
      this.canceledAt,
      this.expiredAt,
      this.graceDaysEndedAt,
      this.startedAt,
      this.suppressedAt,
      this.wasSwitched,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.subscriberType,
      this.subscriberId,
      this.plan});

  factory Subscription.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionFromJson(json);
}

@JsonSerializable()
class Plan {
  int? id;
  @JsonKey(name: 'grace_days')
  int? graceDays;
  String? name;
  int? periodicity;
  @JsonKey(name: 'periodicity_type')
  String? periodicityType;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Plan(
      {this.id,
      this.graceDays,
      this.name,
      this.periodicity,
      this.periodicityType,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  factory Plan.fromJson(Map<String, dynamic> json) => _$PlanFromJson(json);
}
