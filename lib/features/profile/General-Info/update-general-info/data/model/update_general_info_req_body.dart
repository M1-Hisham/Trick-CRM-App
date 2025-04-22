import 'package:json_annotation/json_annotation.dart';

part 'update_general_info_req_body.g.dart';

@JsonSerializable()
class UpdateGeneralInfoReqBody {
  String? name;
  String? email;
  String? phone;
  @JsonKey(name: 'job_title')
  String? jobTitle;
  String? address;

  UpdateGeneralInfoReqBody({
    this.name,
    this.email,
    this.phone,
    this.jobTitle,
    this.address,
  });

  Map<String, dynamic> toJson() => _$UpdateGeneralInfoReqBodyToJson(this);
}
