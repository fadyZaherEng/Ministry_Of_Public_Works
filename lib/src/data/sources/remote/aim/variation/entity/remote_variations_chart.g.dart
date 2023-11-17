// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_variations_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVariationsChart _$RemoteVariationsChartFromJson(
        Map<String, dynamic> json) =>
    RemoteVariationsChart(
      json['mega'] == null
          ? null
          : RemoteVariationsChartItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteVariationsChartItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteVariationsChartItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteVariationsChartToJson(
        RemoteVariationsChart instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
