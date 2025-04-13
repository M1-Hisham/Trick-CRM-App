import 'package:json_annotation/json_annotation.dart';

import '../../../Timeline/data/model/broker_activity_log_model.dart';

part 'broker_view_model.g.dart';

@JsonSerializable()
class BrokerViewModel {
  String? status;
  String? message;
  Broker? broker;
  @JsonKey(name: 'activity_log')
  List<BrokerActivityLogModel>? activityLog;
  BrokerViewModel({this.status, this.message, this.broker});
  factory BrokerViewModel.fromJson(Map<String, dynamic> json) =>
      _$BrokerViewModelFromJson(json);
}

@JsonSerializable()
class Broker {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'owner_id')
  int? ownerId;
  String? email;
  @JsonKey(name: 'company_name')
  String? companyName;
  @JsonKey(name: 'commercial_register')
  String? commercialRegister;
  @JsonKey(name: 'tax_card')
  String? taxCard;
  String? address;
  @JsonKey(name: 'person_name')
  String? personName;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'is_active')
  int? isActive;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Assigned? assigned;
  Owner? owner;

  Broker(
      {this.id,
      this.tenantId,
      this.ownerId,
      this.email,
      this.companyName,
      this.commercialRegister,
      this.taxCard,
      this.address,
      this.personName,
      this.mobile,
      this.mobile2,
      this.assignedToId,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.assigned,
      this.owner});

  factory Broker.fromJson(Map<String, dynamic> json) => _$BrokerFromJson(json);
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

@JsonSerializable()
class Owner {
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

  Owner(
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

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
