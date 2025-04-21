import 'package:json_annotation/json_annotation.dart';

part 'create_campaign_model.g.dart';

@JsonSerializable()
class CreateCampaignModel {
  String? status;
  String? message;
  CreateCampaignModel({
    this.status,
    this.message,
  });
  factory CreateCampaignModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignModelFromJson(json);
}
