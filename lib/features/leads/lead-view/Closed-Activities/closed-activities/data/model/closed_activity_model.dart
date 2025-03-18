import 'package:json_annotation/json_annotation.dart';

import '../../../closed-calls/data/model/closed_call_model.dart';
import '../../../closed-tasks/data/model/closed_task_model.dart';

part 'closed_activity_model.g.dart';

@JsonSerializable()
class ClosedActivityModel {
  int? id;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'task_id')
  int? taskId;
  @JsonKey(name: 'meeting_id')
  dynamic meetingId;
  @JsonKey(name: 'call_id')
  dynamic callId;
  String? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  ClosedTaskModel? task;
  ClosedCallModel? call;
  dynamic meeting;

  ClosedActivityModel({
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
  factory ClosedActivityModel.fromJson(Map<String, dynamic> json) =>
      _$ClosedActivityModelFromJson(json);
}
