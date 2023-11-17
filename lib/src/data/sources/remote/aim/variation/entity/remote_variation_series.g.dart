// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_variation_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVariationSeries _$RemoteVariationSeriesFromJson(
        Map<String, dynamic> json) =>
    RemoteVariationSeries(
      (json['data'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      (json['name'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RemoteVariationSeriesToJson(
        RemoteVariationSeries instance) =>
    <String, dynamic>{
      'data': instance.data,
      'name': instance.name,
    };
