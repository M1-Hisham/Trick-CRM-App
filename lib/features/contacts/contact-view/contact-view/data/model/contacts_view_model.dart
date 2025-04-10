import 'package:json_annotation/json_annotation.dart';

import '../../../Timeline/data/model/contact_activity_log_model.dart';
import '../../../notes/notes-view/model/contact_notes_model.dart';

part 'contacts_view_model.g.dart';

@JsonSerializable()
class ContactsViewModel {
  String? status;
  String? message;
  Contact? contact;
  List<Users>? users;
  List<ContactNotesModel>? contactNotes;
  // List<ContactAttatchment>? contactAttatchment;
  // @JsonKey(name: 'activity_log')
  @JsonKey(name: 'activity_log')
  List<ContactActivityLogModel>? activityLog;
  // List<OpenActivity>? openActivity;
  // List<ClosedActivity>? closedActivity;
  // // List<dynamic>? contactMails;
  // dynamic ziggy;
  // // List<dynamic>? hostUsers;

  ContactsViewModel({
    this.status,
    this.message,
    this.contact,
    this.users,
    this.contactNotes,
    // this.contactAttatchment,
    this.activityLog,
    // this.openActivity,
    // this.closedActivity,
    // // this.contactMails,
    // this.ziggy,
    // this.hostUsers,
  });
  factory ContactsViewModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsViewModelFromJson(json);
}

@JsonSerializable()
class Contact {
  int? id;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'assigned_to_id')
  int? assignedToId;
  @JsonKey(name: 'compaing_id')
  int? compaingId;
  String? saluation;
  @JsonKey(name: 'owner_name')
  String? ownerName;
  @JsonKey(name: 'first_name')
  String? firstName;
  @JsonKey(name: 'last_name')
  String? lastName;
  @JsonKey(name: 'contact_name')
  String? contactName;
  String? company;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  String? website;
  String? rating;
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
  @JsonKey(name: 'converted_client_id')
  dynamic convertedClientId;
  @JsonKey(name: 'is_converted')
  int? isConverted;
  @JsonKey(name: 'end_time')
  String? endTime;
  @JsonKey(name: 'end_time_hour')
  String? endTimeHour;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  Assigned? assigned;

  Contact(
      {this.id,
      this.userId,
      this.tenantId,
      this.assignedToId,
      this.compaingId,
      this.saluation,
      this.ownerName,
      this.firstName,
      this.lastName,
      this.contactName,
      this.company,
      this.jobTitle,
      this.email,
      this.mobile,
      this.mobile2,
      this.website,
      this.rating,
      this.leadSource,
      this.industry,
      this.annualRevenue,
      this.image,
      this.country,
      this.city,
      this.state,
      this.description,
      this.convertedDealId,
      this.convertedClientId,
      this.isConverted,
      this.endTime,
      this.endTimeHour,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.assigned});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
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

// @JsonSerializable()
// class ContactAttatchment {
//   int? id;
//   @JsonKey(name: 'contact_id')
//   int? contactId;
//   @JsonKey(name: 'user_id')
//   int? userId;
//   @JsonKey(name: 'tenant_id')
//   String? tenantId;
//   String? name;
//   String? url;
//   int? status;
//   @JsonKey(name: 'created_at')
//   String? createdAt;
//   @JsonKey(name: 'updated_at')
//   String? updatedAt;
//   Assigned? user;

//   ContactAttatchment(
//       {this.id,
//       this.contactId,
//       this.userId,
//       this.tenantId,
//       this.name,
//       this.url,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.user});

//   factory ContactAttatchment.fromJson(Map<String, dynamic> json) =>
//       _$ContactAttatchmentFromJson(json);
// }



// @JsonSerializable()
// class OpenActivity {
//   int? id;
//   @JsonKey(name: 'contact_id')
//   int? contactId;
//   @JsonKey(name: 'user_id')
//   int? userId;
//   @JsonKey(name: 'tenant_id')
//   String? tenantId;
//   @JsonKey(name: 'task_id')
//   dynamic taskId;
//   @JsonKey(name: 'meeting_id')
//   dynamic meetingId;
//   @JsonKey(name: 'call_id')
//   int? callId;
//   String? status;
//   @JsonKey(name: 'created_at')
//   String? createdAt;
//   @JsonKey(name: 'updated_at')
//   String? updatedAt;
//   dynamic task;
//   Call? call;
//   dynamic meeting;
//   OpenActivity(
//       {this.id,
//       this.contactId,
//       this.userId,
//       this.tenantId,
//       this.taskId,
//       this.meetingId,
//       this.callId,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.task,
//       this.call,
//       this.meeting});
//   factory OpenActivity.fromJson(Map<String, dynamic> json) =>
//       _$OpenActivityFromJson(json);
// }

// @JsonSerializable()
// class Call {
//   int? id;
//   @JsonKey(name: 'tenant_id')
//   String? tenantId;
//   @JsonKey(name: 'call_to')
//   String? callTo;
//   @JsonKey(name: 'lead_id')
//   dynamic leadId;
//   @JsonKey(name: 'contact_id')
//   int? contactId;
//   @JsonKey(name: 'related_to')
//   dynamic relatedTo;
//   @JsonKey(name: 'related_to_client')
//   dynamic relatedToClient;
//   @JsonKey(name: 'client_id')
//   dynamic clientId;
//   @JsonKey(name: 'deal_id')
//   dynamic dealId;
//   @JsonKey(name: 'campaign_id')
//   dynamic campaignId;
//   @JsonKey(name: 'call_type')
//   String? callType;
//   @JsonKey(name: 'call_status')
//   String? callStatus;
//   @JsonKey(name: 'start_time')
//   String? startTime;
//   @JsonKey(name: 'start_time_hour')
//   String? startTimeHour;
//   @JsonKey(name: 'call_owner_id')
//   dynamic callOwnerId;
//   String? subject;
//   @JsonKey(name: 'call_purpose')
//   String? callPurpose;
//   @JsonKey(name: 'call_agenda')
//   String? callAgenda;
//   @JsonKey(name: 'call_result')
//   dynamic callResult;
//   dynamic description;
//   @JsonKey(name: 'is_deleted')
//   int? isDeleted;
//   @JsonKey(name: 'created_at')
//   String? createdAt;
//   @JsonKey(name: 'updated_at')
//   String? updatedAt;
//   dynamic owner;

//   Call(
//       {this.id,
//       this.tenantId,
//       this.callTo,
//       this.leadId,
//       this.contactId,
//       this.relatedTo,
//       this.relatedToClient,
//       this.clientId,
//       this.dealId,
//       this.campaignId,
//       this.callType,
//       this.callStatus,
//       this.startTime,
//       this.startTimeHour,
//       this.callOwnerId,
//       this.subject,
//       this.callPurpose,
//       this.callAgenda,
//       this.callResult,
//       this.description,
//       this.isDeleted,
//       this.createdAt,
//       this.updatedAt,
//       this.owner});

//   factory Call.fromJson(Map<String, dynamic> json) => _$CallFromJson(json);
// }

// @JsonSerializable()
// class ClosedActivity {
//   int? id;
//   @JsonKey(name: 'contact_id')
//   int? contactId;
//   @JsonKey(name: 'user_id')
//   int? userId;
//   @JsonKey(name: 'tenant_id')
//   String? tenantId;
//   @JsonKey(name: 'task_id')
//   int? taskId;
//   @JsonKey(name: 'meeting_id')
//   dynamic meetingId;
//   @JsonKey(name: 'call_id')
//   dynamic callId;
//   String? status;
//   @JsonKey(name: 'created_at')
//   String? createdAt;
//   @JsonKey(name: 'updated_at')
//   String? updatedAt;
//   Task? task;
//   dynamic call;
//   dynamic meeting;

//   ClosedActivity(
//       {this.id,
//       this.contactId,
//       this.userId,
//       this.tenantId,
//       this.taskId,
//       this.meetingId,
//       this.callId,
//       this.status,
//       this.createdAt,
//       this.updatedAt,
//       this.task,
//       this.call,
//       this.meeting});

//   factory ClosedActivity.fromJson(Map<String, dynamic> json) =>
//       _$ClosedActivityFromJson(json);
// }

// @JsonSerializable()
// class Task {
//   int? id;
//   @JsonKey(name: 'user_id')
//   int? userId;
//   @JsonKey(name: 'tenant_id')
//   String? tenantId;
//   @JsonKey(name: 'task_owner')
//   String? taskOwner;
//   @JsonKey(name: 'assigned_to_id')
//   int? assignedToId;
//   @JsonKey(name: 'lead_id')
//   dynamic leadId;
//   @JsonKey(name: 'contact_id')
//   int? contactId;
//   @JsonKey(name: 'client_id')
//   dynamic clientId;
//   String? subject;
//   String? status;
//   String? priority;
//   String? description;
//   @JsonKey(name: 'due_date')
//   String? dueDate;
//   @JsonKey(name: 'is_deleted')
//   int? isDeleted;
//   @JsonKey(name: 'created_at')
//   String? createdAt;
//   @JsonKey(name: 'updated_at')
//   String? updatedAt;

//   Task(
//       {this.id,
//       this.userId,
//       this.tenantId,
//       this.taskOwner,
//       this.assignedToId,
//       this.leadId,
//       this.contactId,
//       this.clientId,
//       this.subject,
//       this.status,
//       this.priority,
//       this.description,
//       this.dueDate,
//       this.isDeleted,
//       this.createdAt,
//       this.updatedAt});

//   factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
// }
