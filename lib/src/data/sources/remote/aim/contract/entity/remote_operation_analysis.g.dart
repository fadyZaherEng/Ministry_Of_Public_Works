// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_operation_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOperationAnalysis _$RemoteOperationAnalysisFromJson(
        Map<String, dynamic> json) =>
    RemoteOperationAnalysis(
      sanitary: json['sanitary'] == null
          ? const RemoteOperationAnalysisItem()
          : RemoteOperationAnalysisItem.fromJson(
              json['sanitary'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteOperationAnalysisToJson(
        RemoteOperationAnalysis instance) =>
    <String, dynamic>{
      'sanitary': instance.sanitary,
    };
