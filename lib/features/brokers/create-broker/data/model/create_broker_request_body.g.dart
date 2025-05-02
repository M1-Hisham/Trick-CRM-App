// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_broker_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBrokerRequestBody _$CreateBrokerRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateBrokerRequestBody(
      assignedToId: (json['assigned_to_id'] as num).toInt(),
      companyName: json['company_name'] as String,
      commercialRegister: json['commercial_register'] as String,
      isActive: json['is_active'] as bool,
      email: json['email'] as String?,
      mobile: json['mobile'] as String?,
      mobile2: json['mobile_2'] as String?,
      taxCard: json['tax_card'] as String?,
      address: json['address'] as String?,
      personName: json['person_name'] as String?,
    );

Map<String, dynamic> _$CreateBrokerRequestBodyToJson(
        CreateBrokerRequestBody instance) =>
    <String, dynamic>{
      'assigned_to_id': instance.assignedToId,
      'company_name': instance.companyName,
      'commercial_register': instance.commercialRegister,
      'is_active': instance.isActive,
      'email': instance.email,
      'mobile': instance.mobile,
      'mobile_2': instance.mobile2,
      'tax_card': instance.taxCard,
      'address': instance.address,
      'person_name': instance.personName,
    };
