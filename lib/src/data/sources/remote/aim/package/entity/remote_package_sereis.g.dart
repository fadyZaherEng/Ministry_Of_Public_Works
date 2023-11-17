// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_package_sereis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePackageSeries _$RemotePackageSeriesFromJson(Map<String, dynamic> json) =>
    RemotePackageSeries(
      (json['data'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RemotePackageSeriesToJson(
        RemotePackageSeries instance) =>
    <String, dynamic>{
      'data': instance.data,
      'name': instance.name,
    };
