import 'package:json_annotation/json_annotation.dart';

part 'closed_call_model.g.dart';

@JsonSerializable()
class ClosedCallModel {
  int? id;
  String? tenantId;
  String? callTo;

  @JsonKey(name: 'lead_id')
  int? leadId;

  @JsonKey(name: 'contact_id')
  int? contactId;

  @JsonKey(name: 'related_to')
  String? relatedTo;

  @JsonKey(name: 'related_to_client')
  String? relatedToClient;

  @JsonKey(name: 'client_id')
  int? clientId;

  @JsonKey(name: 'deal_id')
  int? dealId;

  @JsonKey(name: 'campaign_id')
  int? campaignId;

  @JsonKey(name: 'call_type')
  String? callType;

  @JsonKey(name: 'call_status')
  String? callStatus;

  @JsonKey(name: 'start_time')
  String? startTime;

  @JsonKey(name: 'start_time_hour')
  String? startTimeHour;

  @JsonKey(name: 'call_owner_id')
  int? callOwnerId;

  String? subject;

  @JsonKey(name: 'call_purpose')
  String? callPurpose;

  @JsonKey(name: 'call_agenda')
  String? callAgenda;

  @JsonKey(name: 'call_result')
  String? callResult;

  String? description;

  @JsonKey(name: 'is_deleted')
  int? isDeleted;

  @JsonKey(name: 'created_at')
  String? createdAt;

  @JsonKey(name: 'updated_at')
  String? updatedAt;

  Owner? owner;

  ClosedCallModel(
      {this.id,
      this.tenantId,
      this.callTo,
      this.leadId,
      this.contactId,
      this.relatedTo,
      this.relatedToClient,
      this.clientId,
      this.dealId,
      this.campaignId,
      this.callType,
      this.callStatus,
      this.startTime,
      this.startTimeHour,
      this.callOwnerId,
      this.subject,
      this.callPurpose,
      this.callAgenda,
      this.callResult,
      this.description,
      this.isDeleted,
      this.createdAt,
      this.updatedAt,
      this.owner});

  factory ClosedCallModel.fromJson(Map<String, dynamic> json) =>
      _$ClosedCallModelFromJson(json);

}

@JsonSerializable()
class Owner {
  int? id;
  String? name;
  String? email;

  @JsonKey(name: 'tenant_id')
  String? tenantId;

  @JsonKey(name: 'email_verified_at')
  dynamic emailVerifiedAt;

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
