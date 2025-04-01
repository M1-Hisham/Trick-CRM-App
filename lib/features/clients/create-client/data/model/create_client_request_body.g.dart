// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_client_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateClientRequestBody _$CreateClientRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateClientRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      arName: json['ar_name'] as String,
      nationalId: json['national_id'] as String,
      passportId: json['passport_id'] as String,
      arNationality: json['nationality'] as String,
      arAddress: json['address'] as String,
      brokerId: (json['broker_id'] as num?)?.toInt(),
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      ownerName: json['owner_name'] as String?,
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      industry: json['industry'] as String?,
      annualRevenue: (json['annual_revenue'] as num?)?.toInt(),
      leadSource: json['lead_source'] as String?,
      leadStatus: json['lead_status'] as String?,
      rating: json['rating'] as String?,
      mobile2: json['mobile_2'] as String?,
      jobTitle: json['job_title'] as String?,
      company: json['company'] as String?,
      clientName: json['client_name'] as String?,
    );

Map<String, dynamic> _$CreateClientRequestBodyToJson(
        CreateClientRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'ar_name': instance.arName,
      'national_id': instance.nationalId,
      'passport_id': instance.passportId,
      'nationality': instance.arNationality,
      'address': instance.arAddress,
      'broker_id': instance.brokerId,
      'assigned_to_id': instance.assignedToId,
      'owner_name': instance.ownerName,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'description': instance.description,
      'image': instance.image,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'industry': instance.industry,
      'annual_revenue': instance.annualRevenue,
      'lead_source': instance.leadSource,
      'lead_status': instance.leadStatus,
      'rating': instance.rating,
      'mobile_2': instance.mobile2,
      'job_title': instance.jobTitle,
      'company': instance.company,
      'client_name': instance.clientName,
    };
