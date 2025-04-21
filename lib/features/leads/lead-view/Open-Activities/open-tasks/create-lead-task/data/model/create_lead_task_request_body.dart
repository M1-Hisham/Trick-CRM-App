import 'package:json_annotation/json_annotation.dart';

part 'create_lead_task_request_body.g.dart';

@JsonSerializable()
class CreateLeadTaskRequestBody {
  String subject;
  String? description;
  String? dueDate;
  int assignedTo;
  String priority;
  String lead;
  String status;

  CreateLeadTaskRequestBody({
    required this.subject,
    this.description,
    this.dueDate,
    required this.assignedTo,
    required this.priority,
    required this.lead,
    required this.status,
  });

  Map<String, dynamic> toJson() => _$CreateLeadTaskRequestBodyToJson(this);
}
