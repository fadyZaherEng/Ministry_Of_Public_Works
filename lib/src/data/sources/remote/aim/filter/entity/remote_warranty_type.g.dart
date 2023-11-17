// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_warranty_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteWarrantyType _$RemoteWarrantyTypeFromJson(Map<String, dynamic> json) =>
    RemoteWarrantyType(
      json['id'] as int?,
      json['name'] as String?,
      json['isAllowed'] as String?,
    );

Map<String, dynamic> _$RemoteWarrantyTypeToJson(RemoteWarrantyType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isAllowed': instance.isAllowed,
    };
