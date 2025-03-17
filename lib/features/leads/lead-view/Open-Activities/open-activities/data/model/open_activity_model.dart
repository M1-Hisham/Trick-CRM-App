import 'package:json_annotation/json_annotation.dart';
import 'package:trick_crm_app/features/leads/lead-view/Open-Activities/open-calls/data/model/open_call_model.dart';

import '../../../open-meetings/data/model/open_meeting_model.dart';
import '../../../open-tasks/data/model/open_task_model.dart';

part 'open_activity_model.g.dart';

@JsonSerializable()
class OpenActivityModel {
  int? id;
  @JsonKey(name: "lead_id")
  int? leadId;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "tenant_id")
  String? tenantId;
  @JsonKey(name: "task_id")
  int? taskId;
  @JsonKey(name: "meeting_id")
  int? meetingId;
  @JsonKey(name: "call_id")
  int? callId;
  String? status;
  @JsonKey(name: "created_at")
  String? createdAt;
  @JsonKey(name: "updated_at")
  String? updatedAt;
  OpenTaskModel? task;
  OpenCallModel? call;
  OpenMeetingModel? meeting;

  OpenActivityModel({
    this.id,
    this.leadId,
    this.userId,
    this.tenantId,
    this.taskId,
    this.meetingId,
    this.callId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.task,
    this.call,
    this.meeting,
  });
  factory OpenActivityModel.fromJson(Map<String, dynamic> json) =>
      _$OpenActivityModelFromJson(json);
}

