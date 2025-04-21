import 'package:json_annotation/json_annotation.dart';

part 'project_pending_units_model.g.dart';

@JsonSerializable()
class ProjectPendingUnitsModel {
  List<Data>? data;

  ProjectPendingUnitsModel({this.data});

  factory ProjectPendingUnitsModel.fromJson(Map<String, dynamic> json) =>
      _$ProjectPendingUnitsModelFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'sales_id')
  int? salesId;
  @JsonKey(name: 'unit_type')
  String? unitType;
  @JsonKey(name: 'unit_code')
  String? unitCode;
  @JsonKey(name: 'unit_number')
  String? unitNumber;
  @JsonKey(name: 'building_code')
  String? buildingCode;
  @JsonKey(name: 'building_number')
  String? buildingNumber;
  @JsonKey(name: 'garden_area')
  String? gardenArea;
  @JsonKey(name: 'roof_area')
  String? roofArea;
  @JsonKey(name: 'garage_price')
  String? garagePrice;
  @JsonKey(name: 'meter_price')
  String? meterPrice;
  @JsonKey(name: 'unit_area')
  String? unitArea;
  @JsonKey(name: 'total_price')
  String? totalPrice;
  dynamic floor;
  String? status;
  @JsonKey(name: 'reservation_status')
  String? reservationStatus;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  Project? project;
  @JsonKey(name: 'project_name')
  String? projectName;

  Data(
      {this.id,
      this.tenantId,
      this.userId,
      this.projectId,
      this.salesId,
      this.unitType,
      this.unitCode,
      this.unitNumber,
      this.buildingCode,
      this.buildingNumber,
      this.gardenArea,
      this.roofArea,
      this.garagePrice,
      this.meterPrice,
      this.unitArea,
      this.totalPrice,
      this.floor,
      this.status,
      this.reservationStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.project,
      this.projectName});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class Project {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  String? name;
  String? size;
  String? location;
  String? description;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  String? deletedAt;
  @JsonKey(name: 'project_units')
  List<ProjectUnits>? projectUnits;
  @JsonKey(name: 'project_down_payments')
  List<ProjectDownPayments>? projectDownPayments;

  Project(
      {this.id,
      this.tenantId,
      this.userId,
      this.createdBy,
      this.name,
      this.size,
      this.location,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.projectUnits,
      this.projectDownPayments});

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
}

@JsonSerializable()
class ProjectUnits {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'sales_id')
  int? salesId;
  @JsonKey(name: 'unit_type')
  String? unitType;
  @JsonKey(name: 'unit_code')
  String? unitCode;
  @JsonKey(name: 'unit_number')
  String? unitNumber;
  @JsonKey(name: 'building_code')
  String? buildingCode;
  @JsonKey(name: 'building_number')
  String? buildingNumber;
  @JsonKey(name: 'garden_area')
  String? gardenArea;
  @JsonKey(name: 'roof_area')
  String? roofArea;
  @JsonKey(name: 'garage_price')
  String? garagePrice;
  @JsonKey(name: 'meter_price')
  String? meterPrice;
  @JsonKey(name: 'unit_area')
  String? unitArea;
  @JsonKey(name: 'total_price')
  String? totalPrice;
  dynamic floor;
  String? status;
  @JsonKey(name: 'reservation_status')
  String? reservationStatus;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;

  ProjectUnits(
      {this.id,
      this.tenantId,
      this.userId,
      this.projectId,
      this.salesId,
      this.unitType,
      this.unitCode,
      this.unitNumber,
      this.buildingCode,
      this.buildingNumber,
      this.gardenArea,
      this.roofArea,
      this.garagePrice,
      this.meterPrice,
      this.unitArea,
      this.totalPrice,
      this.floor,
      this.status,
      this.reservationStatus,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  factory ProjectUnits.fromJson(Map<String, dynamic> json) =>
      _$ProjectUnitsFromJson(json);
}

@JsonSerializable()
class ProjectDownPayments {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'project_id')
  int? projectId;
  @JsonKey(name: 'down_payment_id')
  int? downPaymentId;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;
  @JsonKey(name: 'deleted_at')
  dynamic deletedAt;
  @JsonKey(name: 'down_payment')
  DownPayment? downPayment;

  ProjectDownPayments(
      {this.id,
      this.tenantId,
      this.projectId,
      this.downPaymentId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.downPayment});

  factory ProjectDownPayments.fromJson(Map<String, dynamic> json) =>
      _$ProjectDownPaymentsFromJson(json);
}

@JsonSerializable()
class DownPayment {
  int? id;
  @JsonKey(name: 'tenant_id')
  String? tenantId;
  @JsonKey(name: 'user_id')
  int? userId;
  @JsonKey(name: 'created_by')
  String? createdBy;
  @JsonKey(name: 'plan_name')
  String? planName;
  @JsonKey(name: 'down_payment_percentage')
  int? downPaymentPercentage;
  int? years;
  String? discount;
  int? status;
  @JsonKey(name: 'created_at')
  String? createdAt;
  @JsonKey(name: 'updated_at')
  String? updatedAt;

  DownPayment(
      {this.id,
      this.tenantId,
      this.userId,
      this.createdBy,
      this.planName,
      this.downPaymentPercentage,
      this.years,
      this.discount,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory DownPayment.fromJson(Map<String, dynamic> json) =>
      _$DownPaymentFromJson(json);
}
