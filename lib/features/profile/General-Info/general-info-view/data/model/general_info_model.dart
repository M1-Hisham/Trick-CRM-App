import 'package:json_annotation/json_annotation.dart';

part 'general_info_model.g.dart';

@JsonSerializable()
class GeneralInfoModel {
  UserInfo? userInfo;

  GeneralInfoModel({this.userInfo});

  factory GeneralInfoModel.fromJson(Map<String, dynamic> json) =>
      _$GeneralInfoModelFromJson(json);
}

@JsonSerializable()
class UserInfo {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  int? departmentId;
  @JsonKey(name: 'company_id')
  int? companyId;
  String? avatar;
  @JsonKey(name: 'role_as')
  int? roleAs;
  @JsonKey(name: 'is_tenant')
  int? isTenant;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Department? department;
  Details? details;

  UserInfo(
      {this.id,
      this.name,
      this.email,
      this.tenantId,
      this.emailVerifiedAt,
      this.departmentId,
      this.companyId,
      this.avatar,
      this.roleAs,
      this.isTenant,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.department,
      this.details});

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@JsonSerializable()
class Department {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Department(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);
}

@JsonSerializable()
class Details {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? address;
  String? phone;
  @JsonKey(name: 'phone_2')
  String? phone2;
  String? facebook;
  String? instagram;
  @JsonKey(name: 'linked_in')
  String? linkedIn;
  String? twitter;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Details(
      {this.id,
      this.userId,
      this.tenantId,
      this.jobTitle,
      this.address,
      this.phone,
      this.phone2,
      this.facebook,
      this.instagram,
      this.linkedIn,
      this.twitter,
      this.createdAt,
      this.updatedAt});

  factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
}
