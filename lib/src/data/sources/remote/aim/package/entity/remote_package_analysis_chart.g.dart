// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_package_analysis_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePackageAnalysisChart _$RemotePackageAnalysisChartFromJson(
        Map<String, dynamic> json) =>
    RemotePackageAnalysisChart(
      json['mega'] == null
          ? null
          : RemotePackageLevels.fromJson(json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemotePackageLevels.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemotePackageLevels.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemotePackageAnalysisChartToJson(
        RemotePackageAnalysisChart instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
