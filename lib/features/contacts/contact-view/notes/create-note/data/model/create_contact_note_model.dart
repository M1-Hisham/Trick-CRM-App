import 'package:json_annotation/json_annotation.dart';

part 'create_contact_note_model.g.dart';

@JsonSerializable()
class CreateContactNoteModel {
  String? status;
  String? message;

  CreateContactNoteModel({this.status, this.message});

  factory CreateContactNoteModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContactNoteModelFromJson(json);
}
