// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_deal_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDealRequestBody _$CreateDealRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateDealRequestBody(
      dealOwnerId: json['deal_owner_id'] as String,
      dealName: json['deal_name'] as String,
      clientId: (json['client_id'] as num).toInt(),
      amount: (json['amount'] as num).toInt(),
      projectId: (json['project_id'] as num).toInt(),
      unitId: (json['unit_id'] as num).toInt(),
      downPaymentId: (json['down_payment_id'] as num).toInt(),
      years: (json['years'] as num).toInt(),
      reservationStatus: json['reservation_status'] as String,
      downPayment: (json['down_payment'] as num?)?.toInt(),
      brokerId: (json['broker_id'] as num?)?.toInt(),
      unitArea: (json['unit_area'] as num?)?.toDouble(),
      leadSource: json['lead_source'] as String?,
      campaignId: (json['campaign_id'] as num?)?.toInt(),
      closingDate: json['closing_date'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateDealRequestBodyToJson(
        CreateDealRequestBody instance) =>
    <String, dynamic>{
      'deal_owner_id': instance.dealOwnerId,
      'deal_name': instance.dealName,
      'client_id': instance.clientId,
      'amount': instance.amount,
      'project_id': instance.projectId,
      'unit_id': instance.unitId,
      'down_payment_id': instance.downPaymentId,
      'years': instance.years,
      'reservation_status': instance.reservationStatus,
      'down_payment': instance.downPayment,
      'broker_id': instance.brokerId,
      'unit_area': instance.unitArea,
      'lead_source': instance.leadSource,
      'campaign_id': instance.campaignId,
      'closing_date': instance.closingDate,
      'description': instance.description,
    };
