import 'package:json_annotation/json_annotation.dart';

part 'create_task_request_body.g.dart';

@JsonSerializable()
class CreateTaskRequestBody {
  String subject;
  @JsonKey(name: 'assigned_to_id')
  int assignedToId;
  @JsonKey(name: 'lead_id')
  int? leadId;
  @JsonKey(name: 'contact_id')
  int? contactId;
  @JsonKey(name: 'client_id')
  int? clientId;
  String status;
  String priority;
  @JsonKey(name: 'due_date')
  String? dueDate;
  String? description;

  CreateTaskRequestBody({
    required this.subject,
    required this.assignedToId,
    required this.leadId,
    required this.status,
    required this.priority,
    required this.clientId,
    required this.contactId,
    this.dueDate,
    this.description,
  });

  Map<String, dynamic> toJson() => _$CreateTaskRequestBodyToJson(this);
}
