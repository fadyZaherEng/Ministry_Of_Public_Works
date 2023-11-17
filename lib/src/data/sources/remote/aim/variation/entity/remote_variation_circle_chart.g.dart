// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_variation_circle_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVariationCircleChart _$RemoteVariationCircleChartFromJson(
        Map<String, dynamic> json) =>
    RemoteVariationCircleChart(
      (json['variationTotal'] as num?)?.toDouble(),
      json['color'] as String?,
      (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['series'] == null
          ? null
          : RemoteVariationSeries.fromJson(
              json['series'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteVariationCircleChartToJson(
        RemoteVariationCircleChart instance) =>
    <String, dynamic>{
      'variationTotal': instance.total,
      'color': instance.color,
      'colors': instance.colors,
      'series': instance.series,
    };
