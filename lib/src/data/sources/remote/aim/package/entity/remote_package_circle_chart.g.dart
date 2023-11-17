// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_package_circle_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePackageCircleChart _$RemotePackageCircleChartFromJson(
        Map<String, dynamic> json) =>
    RemotePackageCircleChart(
      (json['totalNOPer'] as num?)?.toDouble(),
      json['color'] as String?,
      (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['series'] == null
          ? null
          : RemotePackageSeries.fromJson(
              json['series'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemotePackageCircleChartToJson(
        RemotePackageCircleChart instance) =>
    <String, dynamic>{
      'totalNOPer': instance.total,
      'color': instance.color,
      'colors': instance.colors,
      'series': instance.series,
    };
