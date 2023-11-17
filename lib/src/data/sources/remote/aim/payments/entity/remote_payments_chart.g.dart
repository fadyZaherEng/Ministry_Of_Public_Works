// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_payments_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemotePaymentsChart _$RemotePaymentsChartFromJson(Map<String, dynamic> json) =>
    RemotePaymentsChart(
      json['mega'] == null
          ? null
          : RemotePaymentsChartItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemotePaymentsChartItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemotePaymentsChartItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemotePaymentsChartToJson(
        RemotePaymentsChart instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
