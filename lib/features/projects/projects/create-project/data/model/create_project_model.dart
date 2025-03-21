import 'package:json_annotation/json_annotation.dart';

part 'create_project_model.g.dart';

@JsonSerializable()
class CreateProjectModel {
  final String? status;
  final String? message;
  CreateProjectModel({
    this.status,
    this.message,
  });

  factory CreateProjectModel.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectModelFromJson(json);
}
