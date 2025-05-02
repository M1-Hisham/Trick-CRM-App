import 'package:json_annotation/json_annotation.dart';
import 'package:trick_crm_app/features/clients/client-view/Emails/data/model/client_mails_model.dart';

import '../../../Timeline/data/model/client_activity_log_model.dart';
import '../../../notes/notes-view/model/client_notes_model.dart';

part 'clients_view_model.g.dart';

@JsonSerializable()
class ClientsViewModel {
  String? status;
  String? message;
  Client? client;
  // List<Users>? users;
  List<ClientNotesModel>? clientNotes;
  List<ClientAttatchment>? clientAttatchment;
  @JsonKey(name: 'activity_log')
  List<ClientActivityLogModel>? activityLog;
  // Null oldActivityLog;
  // List<Null>? openActivity;
  // List<Null>? closedActivity;
  // List<CampaignClients>? campaignClients;
  // List<Null>? clientDeals;
  // List<Campaigns>? campaigns;
  List<ClientMailsModel>? clientMails;
  // Null ziggy;
  // List<Null>? calls;
  // List<Null>? contracts;
  // List<TenantContracts>? tenantContracts;
  // List<Null>? deals;
  // Null clientReservedUnit;
  // List<HostUsers>? hostUsers;
  // List<Projects>? projects;

  ClientsViewModel({
    this.status,
    this.message,
    this.client,
    // this.users,
    this.clientNotes,
    this.clientAttatchment,
    this.activityLog,
    // this.oldActivityLog,
    // this.openActivity,
    // this.closedActivity,
    // this.campaignClients,
    // this.clientDeals,
    // this.campaigns,
    this.clientMails,
    // this.ziggy,
    // this.calls,
    // this.contracts,
    // this.tenantContracts,
    // this.deals,
    // this.clientReservedUnit,
    // this.hostUsers,
    // this.projects,
  });
  factory ClientsViewModel.fromJson(Map<String, dynamic> json) =>
      _$ClientsViewModelFromJson(json);
}

@JsonSerializable()
class Client {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'broker_id')
  int? brokerId;
  @JsonKey(name: 'campaing_id')
  dynamic campaingId;
  @JsonKey(name: 'saluation')
  dynamic saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'client_name')
  String? clientName;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  String? website;
  String? rating;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  String? industry;
  @JsonKey(name: 'annual_revenue')
  int? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  @JsonKey(name: 'converted_deal_id')
  dynamic convertedDealId;
  @JsonKey(name: 'converted_contact_id')
  dynamic convertedContactId;
  @JsonKey(name: 'converted_lead_id')
  dynamic convertedLeadId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'ar_name')
  String? arName;
  @JsonKey(name: 'national_id')
  String? nationalId;
  @JsonKey(name: 'passport_id')
  String? passportId;
  String? nationality;
  String? address;
  Assigned? assigned;

  Client(
      {this.id,
      this.userId,
      this.tenantId,
      this.assignedToId,
      this.brokerId,
      this.campaingId,
      this.saluation,
      this.ownerName,
      this.firstName,
      this.lastName,
      this.clientName,
      this.company,
      this.jobTitle,
      this.email,
      this.mobile,
      this.mobile2,
      this.website,
      this.rating,
      this.leadStatus,
      this.leadSource,
      this.industry,
      this.annualRevenue,
      this.image,
      this.country,
      this.city,
      this.state,
      this.description,
      this.convertedDealId,
      this.convertedContactId,
      this.convertedLeadId,
      this.isConverted,
      this.endTime,
      this.endTimeHour,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.arName,
      this.nationalId,
      this.passportId,
      this.nationality,
      this.address,
      this.assigned});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@JsonSerializable()
class Assigned {
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
class ClientAttatchment {
  int? id;
  @JsonKey(name: 'client_id')
  int? clientId;
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
  Assigned? user;

  ClientAttatchment(
      {this.id,
      this.clientId,
      this.userId,
      this.tenantId,
      this.name,
      this.url,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.user});

  factory ClientAttatchment.fromJson(Map<String, dynamic> json) =>
      _$ClientAttatchmentFromJson(json);
}
