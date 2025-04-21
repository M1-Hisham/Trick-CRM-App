import 'package:json_annotation/json_annotation.dart';

part 'create_and_edit_note_request_body.g.dart';

@JsonSerializable()
class CreateAndEditNoteRequestBody {
  String? comment;
  CreateAndEditNoteRequestBody({this.comment});

  Map<String, dynamic> toJson() => _$CreateAndEditNoteRequestBodyToJson(this);
}
