import 'package:json_annotation/json_annotation.dart';

part 'attachments_model.g.dart';

@JsonSerializable()
class LeadAttatchment {
  int? id;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  String? url;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'user_attatchment')
  UserAttatchment? userAttatchment;

  LeadAttatchment({
    this.id,
    this.leadId,
    this.userId,
    this.tenantId,
    this.name,
    this.url,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userAttatchment,
  });
  factory LeadAttatchment.fromJson(Map<String, dynamic> json) =>
      _$LeadAttatchmentFromJson(json);
}

@JsonSerializable()
class UserAttatchment {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  dynamic departmentId;
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
  dynamic department;

  UserAttatchment({
    this.id,
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
  });
  factory UserAttatchment.fromJson(Map<String, dynamic> json) =>
      _$UserAttatchmentFromJson(json);
}
