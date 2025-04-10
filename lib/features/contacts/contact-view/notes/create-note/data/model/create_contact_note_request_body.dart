import 'package:json_annotation/json_annotation.dart';

part 'create_contact_note_request_body.g.dart';

@JsonSerializable()
class CreateContactNoteRequestBody {
  String? comment;
  CreateContactNoteRequestBody({required this.comment});

  Map<String, dynamic> toJson() => _$CreateContactNoteRequestBodyToJson(this);
}
