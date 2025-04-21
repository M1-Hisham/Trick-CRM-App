// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_deal_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateDealModel _$CreateDealModelFromJson(Map<String, dynamic> json) =>
    CreateDealModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      deal: json['deal'] == null
          ? null
          : Deal.fromJson(json['deal'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreateDealModelToJson(CreateDealModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'deal': instance.deal,
    };

Deal _$DealFromJson(Map<String, dynamic> json) => Deal(
      tenantId: json['tenant_id'] as String?,
      dealOwnerId: json['deal_owner_id'] as String?,
      dealName: json['deal_name'] as String?,
      clientId: (json['client_id'] as num?)?.toInt(),
      brokerId: json['broker_id'],
      leadSource: json['lead_source'],
      amount: (json['amount'] as num?)?.toInt(),
      campaignId: json['campaign_id'],
      description: json['description'],
      closingDate: json['closing_date'] as String?,
      createdBy: json['created_by'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      unitId: (json['unit_id'] as num?)?.toInt(),
      downPaymentId: (json['down_payment_id'] as num?)?.toInt(),
      downPayment: json['down_payment'],
      area: json['area'],
      installmentYears: (json['installment_years'] as num?)?.toInt(),
      updatedAt: json['updated_at'] as String?,
      createdAt: json['created_at'] as String?,
      id: (json['id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DealToJson(Deal instance) => <String, dynamic>{
      'tenant_id': instance.tenantId,
      'deal_owner_id': instance.dealOwnerId,
      'deal_name': instance.dealName,
      'client_id': instance.clientId,
      'broker_id': instance.brokerId,
      'lead_source': instance.leadSource,
      'amount': instance.amount,
      'campaign_id': instance.campaignId,
      'description': instance.description,
      'closing_date': instance.closingDate,
      'created_by': instance.createdBy,
      'project_id': instance.projectId,
      'unit_id': instance.unitId,
      'down_payment_id': instance.downPaymentId,
      'down_payment': instance.downPayment,
      'area': instance.area,
      'installment_years': instance.installmentYears,
      'updated_at': instance.updatedAt,
      'created_at': instance.createdAt,
      'id': instance.id,
    };
