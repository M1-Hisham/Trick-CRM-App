import 'package:json_annotation/json_annotation.dart';

part 'client_activity_log_model.g.dart';

@JsonSerializable()
class ClientActivityLogModel {
  int? id;
  @JsonKey(name: 'log_name')
  String? logName;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? description;
  String? subjectType;
  String? event;
  @JsonKey(name: 'subject_id')
  int? subjectId;
  @JsonKey(name: 'causer_type')
  String? causerType;
  @JsonKey(name: 'causer_id')
  int? causerId;
  // List<String>? properties;
  @JsonKey(name: 'batch_uuid')
  dynamic batchUuid;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Assigned? causer;

  ClientActivityLogModel(
      {this.id,
      this.logName,
      this.tenantId,
      this.description,
      this.subjectType,
      this.event,
      this.subjectId,
      this.causerType,
      this.causerId,
      // this.properties,
      this.batchUuid,
      this.createdAt,
      this.updatedAt,
      this.causer});
  factory ClientActivityLogModel.fromJson(Map<String, dynamic> json) =>
      _$ClientActivityLogModelFromJson(json);
}

@JsonSerializable()
class Assigned {
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
  Department? department;

  Assigned(
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
      this.department});

  factory Assigned.fromJson(Map<String, dynamic> json) =>
      _$AssignedFromJson(json);
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
