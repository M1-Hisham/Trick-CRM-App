import 'package:json_annotation/json_annotation.dart';

part 'edit_note_request_body.g.dart';

@JsonSerializable()
class EditNoteRequestBody {
  String? comment;
  EditNoteRequestBody({this.comment});

  Map<String, dynamic> toJson() => _$EditNoteRequestBodyToJson(this);
}
