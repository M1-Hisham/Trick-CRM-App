import 'package:json_annotation/json_annotation.dart';

part 'create_broker_request_body.g.dart';

@JsonSerializable()
class CreateBrokerRequestBody {
  @JsonKey(name: 'assigned_to_id')
  int assignedToId;
  @JsonKey(name: 'company_name')
  String companyName;
  @JsonKey(name: 'commercial_register')
  String commercialRegister;
  @JsonKey(name: 'is_active')
  bool isActive;
  String? email;
  String? mobile;
  @JsonKey(name: 'mobile_2')
  String? mobile2;
  @JsonKey(name: 'tax_card')
  String? taxCard;
  String? address;
  @JsonKey(name: 'person_name')
  String? personName;

  CreateBrokerRequestBody({
    required this.assignedToId,
    required this.companyName,
    required this.commercialRegister,
    required this.isActive,
    this.email,
    this.mobile,
    this.mobile2,
    this.taxCard,
    this.address,
    this.personName,
  });

  Map<String, dynamic> toJson() => _$CreateBrokerRequestBodyToJson(this);
}
