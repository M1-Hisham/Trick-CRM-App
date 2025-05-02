import 'package:json_annotation/json_annotation.dart';

part 'create_contact_model.g.dart';

@JsonSerializable()
class CreateContactModel {
  String? status;
  String? message;
  CreateContactModel({
    this.status,
    this.message,
  });
  factory CreateContactModel.fromJson(Map<String, dynamic> json) =>
      _$CreateContactModelFromJson(json);
}
