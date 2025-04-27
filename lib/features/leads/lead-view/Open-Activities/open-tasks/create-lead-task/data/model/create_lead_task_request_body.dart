import 'package:json_annotation/json_annotation.dart';

part 'create_lead_task_request_body.g.dart';

@JsonSerializable()
class CreateLeadTaskRequestBody {
  String subject;
  String? description;
  @JsonKey(name: 'due_date')
  String? dueDate;
  @JsonKey(name: 'assigned_to_id')
  int assignedToId;
  String priority;
  @JsonKey(name: 'lead_id')
  int? leadId;
  String status;

  CreateLeadTaskRequestBody({
    required this.subject,
    this.description,
    this.dueDate,
    required this.assignedToId,
    required this.priority,
    required this.leadId,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$CreateLeadTaskRequestBodyToJson(this);
}
