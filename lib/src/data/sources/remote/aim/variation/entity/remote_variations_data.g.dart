// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_variations_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteVariationsData _$RemoteVariationsDataFromJson(
        Map<String, dynamic> json) =>
    RemoteVariationsData(
      variations: (json['variationOrdersList'] as List<dynamic>?)
              ?.map((e) => RemoteVariation.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recordsTotal: json['recordsTotal'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteVariationsDataToJson(
        RemoteVariationsData instance) =>
    <String, dynamic>{
      'variationOrdersList': instance.variations,
      'recordsTotal': instance.recordsTotal,
    };
