// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_pending_units_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectPendingUnitsModel _$ProjectPendingUnitsModelFromJson(
        Map<String, dynamic> json) =>
    ProjectPendingUnitsModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectPendingUnitsModelToJson(
        ProjectPendingUnitsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num?)?.toInt(),
      salesId: (json['sales_id'] as num?)?.toInt(),
      unitType: json['unit_type'] as String?,
      unitCode: json['unit_code'] as String?,
      unitNumber: json['unit_number'] as String?,
      buildingCode: json['building_code'] as String?,
      buildingNumber: json['building_number'] as String?,
      gardenArea: json['garden_area'] as String?,
      roofArea: json['roof_area'] as String?,
      garagePrice: json['garage_price'] as String?,
      meterPrice: json['meter_price'] as String?,
      unitArea: json['unit_area'] as String?,
      totalPrice: json['total_price'] as String?,
      floor: json['floor'],
      status: json['status'] as String?,
      reservationStatus: json['reservation_status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      project: json['project'] == null
          ? null
          : Project.fromJson(json['project'] as Map<String, dynamic>),
      projectName: json['project_name'] as String?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'project_id': instance.projectId,
      'sales_id': instance.salesId,
      'unit_type': instance.unitType,
      'unit_code': instance.unitCode,
      'unit_number': instance.unitNumber,
      'building_code': instance.buildingCode,
      'building_number': instance.buildingNumber,
      'garden_area': instance.gardenArea,
      'roof_area': instance.roofArea,
      'garage_price': instance.garagePrice,
      'meter_price': instance.meterPrice,
      'unit_area': instance.unitArea,
      'total_price': instance.totalPrice,
      'floor': instance.floor,
      'status': instance.status,
      'reservation_status': instance.reservationStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'project': instance.project,
      'project_name': instance.projectName,
    };

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      name: json['name'] as String?,
      size: json['size'] as String?,
      location: json['location'] as String?,
      description: json['description'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'] as String?,
      projectUnits: (json['project_units'] as List<dynamic>?)
          ?.map((e) => ProjectUnits.fromJson(e as Map<String, dynamic>))
          .toList(),
      projectDownPayments: (json['project_down_payments'] as List<dynamic>?)
          ?.map((e) => ProjectDownPayments.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'created_by': instance.createdBy,
      'name': instance.name,
      'size': instance.size,
      'location': instance.location,
      'description': instance.description,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'project_units': instance.projectUnits,
      'project_down_payments': instance.projectDownPayments,
    };

ProjectUnits _$ProjectUnitsFromJson(Map<String, dynamic> json) => ProjectUnits(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      projectId: (json['project_id'] as num?)?.toInt(),
      salesId: (json['sales_id'] as num?)?.toInt(),
      unitType: json['unit_type'] as String?,
      unitCode: json['unit_code'] as String?,
      unitNumber: json['unit_number'] as String?,
      buildingCode: json['building_code'] as String?,
      buildingNumber: json['building_number'] as String?,
      gardenArea: json['garden_area'] as String?,
      roofArea: json['roof_area'] as String?,
      garagePrice: json['garage_price'] as String?,
      meterPrice: json['meter_price'] as String?,
      unitArea: json['unit_area'] as String?,
      totalPrice: json['total_price'] as String?,
      floor: json['floor'],
      status: json['status'] as String?,
      reservationStatus: json['reservation_status'] as String?,
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$ProjectUnitsToJson(ProjectUnits instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'project_id': instance.projectId,
      'sales_id': instance.salesId,
      'unit_type': instance.unitType,
      'unit_code': instance.unitCode,
      'unit_number': instance.unitNumber,
      'building_code': instance.buildingCode,
      'building_number': instance.buildingNumber,
      'garden_area': instance.gardenArea,
      'roof_area': instance.roofArea,
      'garage_price': instance.garagePrice,
      'meter_price': instance.meterPrice,
      'unit_area': instance.unitArea,
      'total_price': instance.totalPrice,
      'floor': instance.floor,
      'status': instance.status,
      'reservation_status': instance.reservationStatus,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
    };

ProjectDownPayments _$ProjectDownPaymentsFromJson(Map<String, dynamic> json) =>
    ProjectDownPayments(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      projectId: (json['project_id'] as num?)?.toInt(),
      downPaymentId: (json['down_payment_id'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
      deletedAt: json['deleted_at'],
      downPayment: json['down_payment'] == null
          ? null
          : DownPayment.fromJson(json['down_payment'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectDownPaymentsToJson(
        ProjectDownPayments instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'project_id': instance.projectId,
      'down_payment_id': instance.downPaymentId,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'deleted_at': instance.deletedAt,
      'down_payment': instance.downPayment,
    };

DownPayment _$DownPaymentFromJson(Map<String, dynamic> json) => DownPayment(
      id: (json['id'] as num?)?.toInt(),
      tenantId: json['tenant_id'] as String?,
      userId: (json['user_id'] as num?)?.toInt(),
      createdBy: json['created_by'] as String?,
      planName: json['plan_name'] as String?,
      downPaymentPercentage: (json['down_payment_percentage'] as num?)?.toInt(),
      years: (json['years'] as num?)?.toInt(),
      discount: json['discount'] as String?,
      status: (json['status'] as num?)?.toInt(),
      createdAt: json['created_at'] as String?,
      updatedAt: json['updated_at'] as String?,
    );

Map<String, dynamic> _$DownPaymentToJson(DownPayment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tenant_id': instance.tenantId,
      'user_id': instance.userId,
      'created_by': instance.createdBy,
      'plan_name': instance.planName,
      'down_payment_percentage': instance.downPaymentPercentage,
      'years': instance.years,
      'discount': instance.discount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
