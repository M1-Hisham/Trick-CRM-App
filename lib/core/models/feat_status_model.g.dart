// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feat_status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatStatusModel _$FeatStatusModelFromJson(Map<String, dynamic> json) =>
    FeatStatusModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$FeatStatusModelToJson(FeatStatusModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
