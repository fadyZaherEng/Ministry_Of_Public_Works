// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_penalties_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePenaltiesChart _$RemotePenaltiesChartFromJson(
        Map<String, dynamic> json) =>
    RemotePenaltiesChart(
      json['mega'] == null
          ? null
          : RemotePenaltiesChartItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemotePenaltiesChartItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemotePenaltiesChartItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemotePenaltiesChartToJson(
        RemotePenaltiesChart instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
