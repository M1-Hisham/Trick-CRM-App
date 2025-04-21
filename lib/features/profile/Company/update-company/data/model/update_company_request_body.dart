import 'package:json_annotation/json_annotation.dart';

part 'update_company_request_body.g.dart';

@JsonSerializable()
class UpdateCompanyRequestBody {
  String? name;
  @JsonKey(name: 'phone_number')
  int? phoneNumber;
  String? email;
  String? address;
  String? industry;
  String? website;

  UpdateCompanyRequestBody({
    this.name,
    this.phoneNumber,
    this.email,
    this.address,
    this.industry,
    this.website,
  });

  Map<String, dynamic> toJson() => _$UpdateCompanyRequestBodyToJson(this);
}
