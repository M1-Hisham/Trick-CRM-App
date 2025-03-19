import 'package:json_annotation/json_annotation.dart';

part 'create_campaign_leads_model.g.dart';

@JsonSerializable()
class CreateCampaignLeadsModel {
  String? status;
  String? message;
  CreateCampaignLeadsModel({
    this.status,
    this.message,
  });
  factory CreateCampaignLeadsModel.fromJson(Map<String, dynamic> json) =>
      _$CreateCampaignLeadsModelFromJson(json);
}
