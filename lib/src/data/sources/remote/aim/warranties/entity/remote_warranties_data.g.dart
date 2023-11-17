// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_warranties_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteWarrantiesData _$RemoteWarrantiesDataFromJson(
        Map<String, dynamic> json) =>
    RemoteWarrantiesData(
      (json['warrantiesList'] as List<dynamic>?)
          ?.map((e) => RemoteWarranty.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['recordsTotal'] as int?,
    );

Map<String, dynamic> _$RemoteWarrantiesDataToJson(
        RemoteWarrantiesData instance) =>
    <String, dynamic>{
      'warrantiesList': instance.warranties,
      'recordsTotal': instance.recordsTotal,
    };
