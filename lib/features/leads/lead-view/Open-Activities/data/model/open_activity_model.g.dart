// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open_activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenActivityModel _$OpenActivityModelFromJson(Map<String, dynamic> json) =>
    OpenActivityModel(
      id: (json['id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskId: (json['task_id'] as num?)?.toInt(),
      meetingId: json['meeting_id'],
      callId: json['call_id'],
      status: json['status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      task: json['task'] == null
          ? null
          : Task.fromJson(json['task'] as Map<String, dynamic>),
      call: json['call'] == null
          ? null
          : Call.fromJson(json['call'] as Map<String, dynamic>),
      meeting: json['meeting'] == null
          ? null
          : Meeting.fromJson(json['meeting'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OpenActivityModelToJson(OpenActivityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lead_id': instance.leadId,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'task_id': instance.taskId,
      'meeting_id': instance.meetingId,
      'call_id': instance.callId,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'task': instance.task,
      'call': instance.call,
      'meeting': instance.meeting,
    };

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      taskOwner: json['task_owner'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      clientId: json['client_id'],
      subject: json['subject'] as String?,
      status: json['status'] as String?,
      priority: json['priority'] as String?,
      description: json['description'] as String?,
      dueDate: json['due_date'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'tenant_id': instance.tenantId,
      'task_owner': instance.taskOwner,
      'assigned_to_id': instance.assignedToId,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'subject': instance.subject,
      'status': instance.status,
      'priority': instance.priority,
      'description': instance.description,
      'due_date': instance.dueDate,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Call _$CallFromJson(Map<String, dynamic> json) => Call(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      callTo: json['call_to'] as String?,
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      relatedTo: json['related_to'],
      relatedToClient: json['related_to_client'],
      clientId: json['client_id'],
      dealId: json['deal_id'],
      campaignId: json['campaign_id'],
      callType: json['call_type'],
      callStatus: json['call_status'] as String?,
      startTime: json['start_time'],
      startTimeHour: json['start_time_hour'],
      callOwnerId: (json['call_owner_id'] as num?)?.toInt(),
      subject: json['subject'] as String?,
      callPurpose: json['call_purpose'],
      callAgenda: json['call_agenda'],
      callResult: json['call_result'],
      description: json['description'],
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CallToJson(Call instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'call_to': instance.callTo,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'client_id': instance.clientId,
      'deal_id': instance.dealId,
      'campaign_id': instance.campaignId,
      'call_type': instance.callType,
      'call_status': instance.callStatus,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'call_owner_id': instance.callOwnerId,
      'subject': instance.subject,
      'call_purpose': instance.callPurpose,
      'call_agenda': instance.callAgenda,
      'call_result': instance.callResult,
      'description': instance.description,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'owner': instance.owner,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: json['department_id'],
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'],
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenant_id': instance.tenantId,
      'email_verified_at': instance.emailVerifiedAt,
      'department_id': instance.departmentId,
      'company_id': instance.companyId,
      'avatar': instance.avatar,
      'role_as': instance.roleAs,
      'is_tenant': instance.isTenant,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'department': instance.department,
    };

Meeting _$MeetingFromJson(Map<String, dynamic> json) => Meeting(
      id: (json['id'] as num?)?.toInt(),
      createdBy: (json['created_by'] as num?)?.toInt(),
      hostId: (json['host_id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      title: json['title'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      startTime: json['start_time'] as String?,
      startTimeHour: json['start_time_hour'],
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'],
      allDay: (json['all_day'] as num?)?.toInt(),
      participants: json['participants'] as String?,
      relatedTo: json['related_to'] as String?,
      relatedToClient: json['related_to_client'],
      leadId: (json['lead_id'] as num?)?.toInt(),
      contactId: json['contact_id'],
      clientId: json['client_id'],
      status: json['status'] as String?,
      isDeleted: (json['is_deleted'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      dealId: json['deal_id'],
      compaignId: json['compaign_id'],
      host: json['host'] == null
          ? null
          : Host.fromJson(json['host'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MeetingToJson(Meeting instance) => <String, dynamic>{
      'id': instance.id,
      'created_by': instance.createdBy,
      'host_id': instance.hostId,
      'tenant_id': instance.tenantId,
      'title': instance.title,
      'location': instance.location,
      'description': instance.description,
      'start_time': instance.startTime,
      'start_time_hour': instance.startTimeHour,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'all_day': instance.allDay,
      'participants': instance.participants,
      'related_to': instance.relatedTo,
      'related_to_client': instance.relatedToClient,
      'lead_id': instance.leadId,
      'contact_id': instance.contactId,
      'client_id': instance.clientId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deal_id': instance.dealId,
      'compaign_id': instance.compaignId,
      'host': instance.host,
    };

Host _$HostFromJson(Map<String, dynamic> json) => Host(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      tenantId: json['tenant_id'] as String?,
      emailVerifiedAt: json['email_verified_at'] as String?,
      departmentId: (json['department_id'] as num?)?.toInt(),
      companyId: (json['company_id'] as num?)?.toInt(),
      avatar: json['avatar'] as String?,
      roleAs: (json['role_as'] as num?)?.toInt(),
      isTenant: (json['is_tenant'] as num?)?.toInt(),
      isActive: (json['is_active'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      department: json['department'] == null
          ? null
          : Department.fromJson(json['department'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HostToJson(Host instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'tenant_id': instance.tenantId,
      'email_verified_at': instance.emailVerifiedAt,
      'department_id': instance.departmentId,
      'company_id': instance.companyId,
      'avatar': instance.avatar,
      'role_as': instance.roleAs,
      'is_tenant': instance.isTenant,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'department': instance.department,
    };

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      name: json['name'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'name': instance.name,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
