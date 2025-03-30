// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_brokers_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBrokersModel _$CreateBrokersModelFromJson(Map<String, dynamic> json) =>
    CreateBrokersModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateBrokersModelToJson(CreateBrokersModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
