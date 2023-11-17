// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_approved_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteApprovedAnalysis _$RemoteApprovedAnalysisFromJson(
        Map<String, dynamic> json) =>
    RemoteApprovedAnalysis(
      json['mega'] == null
          ? null
          : RemoteApprovedAnalysisItem.fromJson(
              json['mega'] as Map<String, dynamic>),
      json['sanitary'] == null
          ? null
          : RemoteApprovedAnalysisItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
      json['construction'] == null
          ? null
          : RemoteApprovedAnalysisItem.fromJson(
              json['construction'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteApprovedAnalysisToJson(
        RemoteApprovedAnalysis instance) =>
    <String, dynamic>{
      'mega': instance.mega,
      'sanitary': instance.sanitary,
      'construction': instance.construction,
    };
