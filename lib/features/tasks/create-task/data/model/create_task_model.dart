import 'package:json_annotation/json_annotation.dart';

part 'create_task_model.g.dart';

@JsonSerializable()
class CreateTaskModel {
  String? status;
  String? message;
  CreateTaskModel({
    this.status,
    this.message,
  });
  factory CreateTaskModel.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskModelFromJson(json);
}
