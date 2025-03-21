import 'package:json_annotation/json_annotation.dart';

part 'create_project_request_body.g.dart';

@JsonSerializable()
class CreateProjectRequestBody {
  String? image;
  String name;
  int size;
  String location;
  String? description;
  @JsonKey(name: "payment_plans")
  List<int>? paymentplans;
  CreateProjectRequestBody({
    this.image,
    required this.name,
    required this.size,
    required this.location,
    this.description,
    this.paymentplans,
  });

  Map<String, dynamic> toJson() => _$CreateProjectRequestBodyToJson(this);
}
