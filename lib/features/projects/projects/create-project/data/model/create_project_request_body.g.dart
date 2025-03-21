// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_project_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProjectRequestBody _$CreateProjectRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateProjectRequestBody(
      image: json['image'] as String?,
      name: json['name'] as String,
      size: (json['size'] as num).toInt(),
      location: json['location'] as String,
      description: json['description'] as String?,
      paymentplans: (json['payment_plans'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$CreateProjectRequestBodyToJson(
        CreateProjectRequestBody instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'size': instance.size,
      'location': instance.location,
      'description': instance.description,
      'payment_plans': instance.paymentplans,
    };
