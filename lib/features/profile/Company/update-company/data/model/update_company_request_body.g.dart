// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_company_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCompanyRequestBody _$UpdateCompanyRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateCompanyRequestBody(
      name: json['name'] as String?,
      phoneNumber: (json['phone_number'] as num?)?.toInt(),
      email: json['email'] as String?,
      address: json['address'] as String?,
      industry: json['industry'] as String?,
      website: json['website'] as String?,
    );

Map<String, dynamic> _$UpdateCompanyRequestBodyToJson(
        UpdateCompanyRequestBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phone_number': instance.phoneNumber,
      'email': instance.email,
      'address': instance.address,
      'industry': instance.industry,
      'website': instance.website,
    };
