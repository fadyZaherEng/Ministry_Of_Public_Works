// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_delay_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteDelayAnalysis _$RemoteDelayAnalysisFromJson(Map<String, dynamic> json) =>
    RemoteDelayAnalysis(
      mega: json['mega'] == null
          ? const RemoteDelayAnalysisItem()
          : RemoteDelayAnalysisItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      sanitary: json['sanitary'] == null
          ? const RemoteDelayAnalysisItem()
          : RemoteDelayAnalysisItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      construction: json['construction'] == null
          ? const RemoteDelayAnalysisItem()
          : RemoteDelayAnalysisItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteDelayAnalysisToJson(
        RemoteDelayAnalysis instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
