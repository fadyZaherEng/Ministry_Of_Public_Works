// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_overview_chart_by_sector.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOverviewChartBySector _$RemoteOverviewChartBySectorFromJson(
        Map<String, dynamic> json) =>
    RemoteOverviewChartBySector(
      json['mega'] == null
          ? null
          : RemoteOverviewLevels.fromJson(json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteOverviewLevels.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteOverviewLevels.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteOverviewChartBySectorToJson(
        RemoteOverviewChartBySector instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
