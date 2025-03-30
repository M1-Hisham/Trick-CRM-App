import 'package:json_annotation/json_annotation.dart';

part 'create_brokers_model.g.dart';

@JsonSerializable()
class CreateBrokersModel {
  String? status;
  String? message;

  CreateBrokersModel({this.status, this.message});
  factory CreateBrokersModel.fromJson(Map<String, dynamic> json) =>
      _$CreateBrokersModelFromJson(json);
}
