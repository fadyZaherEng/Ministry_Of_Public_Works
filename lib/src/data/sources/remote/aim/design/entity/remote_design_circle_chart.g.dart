// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_design_circle_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDesignCircleChart _$RemoteDesignCircleChartFromJson(
        Map<String, dynamic> json) =>
    RemoteDesignCircleChart(
      (json['totalDelay'] as num?)?.toDouble(),
      json['color'] as String?,
      (json['colors'] as List<dynamic>?)?.map((e) => e as String).toList(),
      json['series'] == null
          ? null
          : RemoteVariationSeries.fromJson(
              json['series'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteDesignCircleChartToJson(
        RemoteDesignCircleChart instance) =>
    <String, dynamic>{
      'totalDelay': instance.total,
      'color': instance.color,
      'colors': instance.colors,
      'series': instance.series,
    };
