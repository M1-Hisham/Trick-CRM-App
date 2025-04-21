// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      tenantCompanyData: json['tenantCompanyData'] == null
          ? null
          : TenantCompanyData.fromJson(
              json['tenantCompanyData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'tenantCompanyData': instance.tenantCompanyData,
    };

TenantCompanyData _$TenantCompanyDataFromJson(Map<String, dynamic> json) =>
    TenantCompanyData(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      fax: (json['fax'] as num?)?.toInt(),
      phoneNumber: (json['phone_number'] as num?)?.toInt(),
      phoneNumber2: (json['phone_number_2'] as num?)?.toInt(),
      email: json['email'] as String?,
      industry: json['industry'] as String?,
      address: json['address'] as String?,
      address2: json['address_2'] as String?,
      website: json['website'] as String?,
      logo: json['logo'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TenantCompanyDataToJson(TenantCompanyData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'fax': instance.fax,
      'phone_number': instance.phoneNumber,
      'phone_number_2': instance.phoneNumber2,
      'email': instance.email,
      'industry': instance.industry,
      'address': instance.address,
      'address_2': instance.address2,
      'website': instance.website,
      'logo': instance.logo,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
