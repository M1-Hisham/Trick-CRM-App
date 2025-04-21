// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_contact_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateContactRequestBody _$CreateContactRequestBodyFromJson(
        Map<String, dynamic> json) =>
    CreateContactRequestBody(
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      mobile: json['mobile'] as String,
      image: json['image'] as String?,
      mobile2: json['mobile_2'] as String?,
      assignedToId: (json['assigned_to_id'] as num?)?.toInt(),
      endTime: json['end_time'] as String?,
      endTimeHour: json['end_time_hour'] as String?,
      company: json['company'] as String?,
      jobTitle: json['job_title'] as String?,
      industry: json['industry'] as String?,
      rating: json['rating'] as String?,
      annualRevenue: (json['annual_revenue'] as num?)?.toInt(),
      website: json['website'] as String?,
      leadSource: json['lead_source'] as String?,
      state: json['state'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CreateContactRequestBodyToJson(
        CreateContactRequestBody instance) =>
    <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'mobile': instance.mobile,
      'image': instance.image,
      'mobile_2': instance.mobile2,
      'assigned_to_id': instance.assignedToId,
      'end_time': instance.endTime,
      'end_time_hour': instance.endTimeHour,
      'company': instance.company,
      'job_title': instance.jobTitle,
      'industry': instance.industry,
      'rating': instance.rating,
      'annual_revenue': instance.annualRevenue,
      'website': instance.website,
      'lead_source': instance.leadSource,
      'state': instance.state,
      'city': instance.city,
      'country': instance.country,
      'description': instance.description,
    };
