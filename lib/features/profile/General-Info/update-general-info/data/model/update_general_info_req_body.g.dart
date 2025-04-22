// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_general_info_req_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateGeneralInfoReqBody _$UpdateGeneralInfoReqBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateGeneralInfoReqBody(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      jobTitle: json['job_title'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$UpdateGeneralInfoReqBodyToJson(
        UpdateGeneralInfoReqBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'job_title': instance.jobTitle,
      'address': instance.address,
    };
