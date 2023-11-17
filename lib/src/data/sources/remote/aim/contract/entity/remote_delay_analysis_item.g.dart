// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_delay_analysis_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDelayAnalysisItem _$RemoteDelayAnalysisItemFromJson(
        Map<String, dynamic> json) =>
    RemoteDelayAnalysisItem(
      ALessThan: json['a_LessThan'] as int? ?? 0,
      BBetween: json['b_Between'] as int? ?? 0,
      CMoreThan: json['c_MoreThan'] as int? ?? 0,
    );

Map<String, dynamic> _$RemoteDelayAnalysisItemToJson(
        RemoteDelayAnalysisItem instance) =>
    <String, dynamic>{
      'a_LessThan': instance.ALessThan,
      'b_Between': instance.BBetween,
      'c_MoreThan': instance.CMoreThan,
    };
