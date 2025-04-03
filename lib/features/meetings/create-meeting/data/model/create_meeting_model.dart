import 'package:json_annotation/json_annotation.dart';

part 'create_meeting_model.g.dart';

@JsonSerializable()
class CreateMeetingModel {
  String? status;
  String? message;
  CreateMeetingModel({this.status, this.message});
  factory CreateMeetingModel.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingModelFromJson(json);
}
