// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_issues_analysis_chart_by_sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIssuesAnalysisChartBySector _$RemoteIssuesAnalysisChartBySectorFromJson(
        Map<String, dynamic> json) =>
    RemoteIssuesAnalysisChartBySector(
      json['mega'] == null
          ? null
          : RemoteIssuesLevels.fromJson(json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteIssuesLevels.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteIssuesLevels.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteIssuesAnalysisChartBySectorToJson(
        RemoteIssuesAnalysisChartBySector instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
