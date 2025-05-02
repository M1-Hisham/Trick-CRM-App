import 'package:json_annotation/json_annotation.dart';

part 'feat_status_model.g.dart';

@JsonSerializable()
class FeatStatusModel {
  String? status;
  String? message;
  FeatStatusModel({this.status, this.message});
  factory FeatStatusModel.fromJson(Map<String, dynamic> json) =>
      _$FeatStatusModelFromJson(json);
}
