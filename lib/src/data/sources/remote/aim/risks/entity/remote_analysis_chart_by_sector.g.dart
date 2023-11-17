// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_analysis_chart_by_sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAnalysisChartBySector _$RemoteAnalysisChartBySectorFromJson(
        Map<String, dynamic> json) =>
    RemoteAnalysisChartBySector(
      json['mega'] == null
          ? null
          : RemoteLevels.fromJson(json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteLevels.fromJson(json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteLevels.fromJson(json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteAnalysisChartBySectorToJson(
        RemoteAnalysisChartBySector instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
