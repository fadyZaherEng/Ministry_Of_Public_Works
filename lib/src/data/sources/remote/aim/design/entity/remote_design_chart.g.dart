// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_design_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDesignChart _$RemoteDesignChartFromJson(Map<String, dynamic> json) =>
    RemoteDesignChart(
      json['mega'] == null
          ? null
          : RemoteDesignChartItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteDesignChartItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteDesignChartItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteDesignChartToJson(RemoteDesignChart instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
