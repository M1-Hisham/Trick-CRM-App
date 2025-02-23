import 'package:json_annotation/json_annotation.dart';

import '../../../../../campaigns/model/campaigns_model.dart';
import '../../../Attatchments/attachment-view/model/attachments_model.dart';
import '../../../Close-activities/data/model/closed_activity_model.dart';
import '../../../Open-Activities/data/model/open_activity_model.dart';
import '../../../notes/notes-view/model/lead_note.dart';

part 'leads_view_model.g.dart';

@JsonSerializable()
class LeadsViewModel {
  String? status;
  Lead? lead;
  List<Users>? users;
  List<LeadNote>? leadNotes;
  List<LeadAttatchment>? leadAttatchment;
  @JsonKey(name: 'activity_log')
  List<ActivityLog>? activityLog;
  List<OpenActivityModel>? openActivity;
  List<ClosedActivityModel>? closedActivity;
  // List<dynamic>? campaignLeads;
  List<CampaignsModel>? campaigns;
  // List<dynamic>? leadMails;
  List<Calls>? calls;
  // List<dynamic>? contacts;
  List<Clients>? clients;
  List<Deals>? deals;
  List<HostUsers>? hostUsers;

  LeadsViewModel({
    this.status,
    this.lead,
    this.users,
    this.leadNotes,
    this.leadAttatchment,
    this.activityLog,
    this.openActivity,
    this.closedActivity,
    // this.campaignLeads,
    this.campaigns,
    // this.leadMails,
    this.calls,
    // this.contacts,
    this.clients,
    this.deals,
    this.hostUsers,
  });

  factory LeadsViewModel.fromJson(Map<String, dynamic> json) =>
      _$LeadsViewModelFromJson(json);
}

@JsonSerializable()
class Lead {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'compaing_id')
  String? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
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
  @JsonKey(name: 'fb_lead_id')
  String? fbLeadId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_campaign_name')
  String? fbCampaignName;
  @JsonKey(name: 'converted_deal_id')
  String? convertedDealId;
  @JsonKey(name: 'converted_client_id')
  String? convertedClientId;
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
  Assigned? assigned;

  Lead({
    this.id,
    this.userId,
    this.assignedToId,
    this.tenantId,
    this.compaingId,
    this.saluation,
    this.ownerName,
    this.firstName,
    this.lastName,
    this.leadName,
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
    this.fbLeadId,
    this.fbAdName,
    this.fbCampaignName,
    this.convertedDealId,
    this.convertedClientId,
    this.isConverted,
    this.endTime,
    this.endTimeHour,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.assigned,
  });

  factory Lead.fromJson(Map<String, dynamic> json) => _$LeadFromJson(json);
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
  AssignedDepartment? department;

  Assigned({
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

  factory Assigned.fromJson(Map<String, dynamic> json) =>
      _$AssignedFromJson(json);
}

@JsonSerializable()
class AssignedDepartment {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  AssignedDepartment(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory AssignedDepartment.fromJson(Map<String, dynamic> json) =>
      _$AssignedDepartmentFromJson(json);
}

@JsonSerializable()
class Users {
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

  Users({
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

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
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
class ActivityLog {
  int? id;
  @JsonKey(name: 'log_name')
  String? logName;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? description;
  @JsonKey(name: 'subject_type')
  String? subjectType;
  String? event;
  @JsonKey(name: 'subject_id')
  int? subjectId;
  @JsonKey(name: 'causer_type')
  String? causerType;
  @JsonKey(name: 'causer_id')
  int? causerId;
  Properties? properties;
  @JsonKey(name: 'batch_uuid')
  dynamic batchUuid;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Causer? causer;
  Subject? subject;

  ActivityLog({
    this.id,
    this.logName,
    this.tenantId,
    this.description,
    this.subjectType,
    this.event,
    this.subjectId,
    this.causerType,
    this.causerId,
    this.properties,
    this.batchUuid,
    this.createdAt,
    this.updatedAt,
    this.causer,
    this.subject,
  });

  factory ActivityLog.fromJson(Map<String, dynamic> json) =>
      _$ActivityLogFromJson(json);
}

@JsonSerializable()
class Properties {
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  Attributes? attributes;

  Properties({this.tenantId, this.attributes});

  factory Properties.fromJson(Map<String, dynamic> json) =>
      _$PropertiesFromJson(json);
}

@JsonSerializable()
class Attributes {
  String? city;
  String? email;
  String? image;
  String? state;
  String? mobile;
  String? rating;
  String? company;
  String? country;
  @JsonKey(name: 'user_id')
  int? userId;
  String? website;
  @JsonKey(name: 'end_time')
  String? endTime;
  String? industry;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_lead_id')
  String? fbLeadId;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'compaing_id')
  String? compaingId;
  String? description;
  @JsonKey(name: 'lead_source')
  String? leadSource;
  @JsonKey(name: 'lead_status')
  String? leadStatus;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'fb_campaign_name')
  dynamic fbCampaignName;

  Attributes({
    this.city,
    this.email,
    this.image,
    this.state,
    this.mobile,
    this.rating,
    this.company,
    this.country,
    this.userId,
    this.website,
    this.endTime,
    this.industry,
    this.mobile2,
    this.jobTitle,
    this.lastName,
    this.leadName,
    this.tenantId,
    this.fbAdName,
    this.fbLeadId,
    this.firstName,
    this.ownerName,
    this.compaingId,
    this.description,
    this.leadSource,
    this.leadStatus,
    this.isConverted,
    this.endTimeHour,
    this.assignedToId,
    this.fbCampaignName,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
}

@JsonSerializable()
class Causer {
  int? id;
  String? name;
  String? email;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'email_verified_at')
  String? emailVerifiedAt;
  @JsonKey(name: 'department_id')
  String? departmentId;
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

  Causer({
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

  factory Causer.fromJson(Map<String, dynamic> json) => _$CauserFromJson(json);
}

@JsonSerializable()
class Subject {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'assigned_to_id')
  String? assignedToId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'compaing_id')
  String? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'lead_name')
  String? leadName;
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
  String? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  @JsonKey(name: 'fb_lead_id')
  String? fbLeadId;
  @JsonKey(name: 'fb_ad_name')
  String? fbAdName;
  @JsonKey(name: 'fb_campaign_name')
  String? fbCampaignName;
  @JsonKey(name: 'converted_deal_id')
  String? convertedDealId;
  @JsonKey(name: 'converted_client_id')
  String? convertedClientId;
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
  Assigned? assigned;

  Subject({
    this.id,
    this.userId,
    this.assignedToId,
    this.tenantId,
    this.compaingId,
    this.saluation,
    this.ownerName,
    this.firstName,
    this.lastName,
    this.leadName,
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
    this.fbLeadId,
    this.fbAdName,
    this.fbCampaignName,
    this.convertedDealId,
    this.convertedClientId,
    this.isConverted,
    this.endTime,
    this.endTimeHour,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.assigned,
  });

  factory Subject.fromJson(Map<String, dynamic> json) =>
      _$SubjectFromJson(json);
}

@JsonSerializable()
class Calls {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'call_to')
  String? callTo;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  String? contactId;
  @JsonKey(name: 'related_to')
  String? relatedTo;
  @JsonKey(name: 'related_to_client')
  String? relatedToClient;
  @JsonKey(name: 'client_id')
  int? clientId;
  @JsonKey(name: 'deal_id')
  String? dealId;
  @JsonKey(name: 'campaign_id')
  String? campaignId;
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
  dynamic lead;
  CallsOwner? owner;
  Client? client;
  String? contact;

  Calls({
    this.id,
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
    this.lead,
    this.owner,
    this.client,
    this.contact,
  });

  factory Calls.fromJson(Map<String, dynamic> json) => _$CallsFromJson(json);
}

@JsonSerializable()
class CallsOwner {
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
  CallsOwnerDepartment? department;

  CallsOwner({
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
  factory CallsOwner.fromJson(Map<String, dynamic> json) =>
      _$CallsOwnerFromJson(json);
}

@JsonSerializable()
class CallsOwnerDepartment {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  String? name;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  CallsOwnerDepartment(
      {this.id, this.tenantId, this.name, this.createdAt, this.updatedAt});

  factory CallsOwnerDepartment.fromJson(Map<String, dynamic> json) =>
      _$CallsOwnerDepartmentFromJson(json);
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
  dynamic brokerId;
  @JsonKey(name: 'campaing_id')
  dynamic campaingId;
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
      this.address});

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}

@JsonSerializable()
class Clients {
  int? id;
  int? userId;
  String? tenantId;
  int? assignedToId;
  dynamic brokerId;
  dynamic campaingId;
  String? saluation;
  String? ownerName;
  String? firstName;
  String? lastName;
  String? clientName;
  String? company;
  String? jobTitle;
  String? email;
  String? mobile;
  String? mobile2;
  String? website;
  String? rating;
  String? leadStatus;
  String? leadSource;
  String? industry;
  int? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  dynamic convertedDealId;
  dynamic convertedContactId;
  int? convertedLeadId;
  int? isConverted;
  String? endTime;
  String? endTimeHour;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? arName;
  String? nationalId;
  String? passportId;
  String? nationality;
  String? address;

  Clients({
    this.id,
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
  });

  factory Clients.fromJson(Map<String, dynamic> json) =>
      _$ClientsFromJson(json);
}

@JsonSerializable()
class Deals {
  int? id;
  String? tenantId;
  int? dealOwnerId;
  dynamic brokerId;
  String? dealName;
  int? clientId;
  String? leadSource;
  String? amount;
  dynamic campaignId;
  String? description;
  String? closingDate;
  String? createdBy;
  int? projectId;
  int? unitId;
  int? downPaymentId;
  dynamic area;
  dynamic installmentYears;
  dynamic downPayment;
  String? status;
  int? isDeleted;
  String? createdAt;
  String? updatedAt;
  DealsClient? client;
  DealsUsers? owner;
  dynamic campaign;

  Deals({
    this.id,
    this.tenantId,
    this.dealOwnerId,
    this.brokerId,
    this.dealName,
    this.clientId,
    this.leadSource,
    this.amount,
    this.campaignId,
    this.description,
    this.closingDate,
    this.createdBy,
    this.projectId,
    this.unitId,
    this.downPaymentId,
    this.area,
    this.installmentYears,
    this.downPayment,
    this.status,
    this.isDeleted,
    this.createdAt,
    this.updatedAt,
    this.client,
    this.owner,
    this.campaign,
  });

  factory Deals.fromJson(Map<String, dynamic> json) => _$DealsFromJson(json);
}

@JsonSerializable()
class DealsClient {
  int? id;
  int? userId;
  String? tenantId;
  int? assignedToId;
  dynamic brokerId;
  dynamic campaingId;
  dynamic saluation;
  String? ownerName;
  String? firstName;
  String? lastName;
  String? clientName;
  String? company;
  String? jobTitle;
  String? email;
  String? mobile;
  String? mobile2;
  String? website;
  String? rating;
  String? leadStatus;
  String? leadSource;
  String? industry;
  int? annualRevenue;
  String? image;
  String? country;
  String? city;
  String? state;
  String? description;
  dynamic convertedDealId;
  dynamic convertedContactId;
  dynamic convertedLeadId;
  int? isConverted;
  String? endTime;
  String? endTimeHour;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;
  String? arName;
  String? nationalId;
  String? passportId;
  String? nationality;
  String? address;

  DealsClient({
    this.id,
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
  });

  factory DealsClient.fromJson(Map<String, dynamic> json) =>
      _$DealsClientFromJson(json);
}

@JsonSerializable()
class DealsUsers {
  int? id;
  String? name;
  String? email;
  String? tenantId;
  String? emailVerifiedAt;
  dynamic departmentId;
  int? companyId;
  String? avatar;
  int? roleAs;
  int? isTenant;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic department;

  DealsUsers({
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

  factory DealsUsers.fromJson(Map<String, dynamic> json) =>
      _$DealsUsersFromJson(json);
}

@JsonSerializable()
class HostUsers {
  int? id;
  String? name;
  String? email;
  String? tenantId;
  String? emailVerifiedAt;
  dynamic departmentId;
  dynamic companyId;
  String? avatar;
  int? roleAs;
  int? isTenant;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic department;

  HostUsers({
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
  factory HostUsers.fromJson(Map<String, dynamic> json) =>
      _$HostUsersFromJson(json);
}
