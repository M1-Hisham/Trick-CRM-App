import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';

@JsonSerializable()
class CompanyModel {
  String? status;
  String? message;
  TenantCompanyData? tenantCompanyData;

  CompanyModel({this.status, this.message, this.tenantCompanyData});

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);
}

@JsonSerializable()
class TenantCompanyData {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  int? fax;
  @JsonKey(name: 'phone_number')
  int? phoneNumber;
  @JsonKey(name: 'phone_number_2')
  int? phoneNumber2;
  String? email;
  String? industry;
  String? address;
  @JsonKey(name: 'address_2')
  String? address2;
  String? website;
  String? logo;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  TenantCompanyData(
      {this.id,
      this.tenantId,
      this.name,
      this.fax,
      this.phoneNumber,
      this.phoneNumber2,
      this.email,
      this.industry,
      this.address,
      this.address2,
      this.website,
      this.logo,
      this.createdAt,
      this.updatedAt});

  factory TenantCompanyData.fromJson(Map<String, dynamic> json) =>
      _$TenantCompanyDataFromJson(json);
}
