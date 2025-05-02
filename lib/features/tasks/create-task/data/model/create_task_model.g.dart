// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskModel _$CreateTaskModelFromJson(Map<String, dynamic> json) =>
    CreateTaskModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateTaskModelToJson(CreateTaskModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
