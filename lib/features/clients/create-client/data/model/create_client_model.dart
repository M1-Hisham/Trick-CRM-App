import 'package:json_annotation/json_annotation.dart';

part 'create_client_model.g.dart';

@JsonSerializable()
class CreateClientModel {
  String? status;
  String? message;
  CreateClientModel({
    this.status,
    this.message,
  });
  factory CreateClientModel.fromJson(Map<String, dynamic> json) =>
      _$CreateClientModelFromJson(json);
}
