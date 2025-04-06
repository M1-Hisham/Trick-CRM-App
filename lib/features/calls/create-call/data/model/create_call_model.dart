import 'package:json_annotation/json_annotation.dart';

part 'create_call_model.g.dart';

@JsonSerializable()
class CreateCallModel {
  String? status;
  String? message;
  CreateCallModel({this.status, this.message});

  factory CreateCallModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCallModelFromJson(json);
}
