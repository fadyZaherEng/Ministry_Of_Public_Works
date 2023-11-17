// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_analysis_chart_by_phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteAnalysisChartByPhase _$RemoteAnalysisChartByPhaseFromJson(
        Map<String, dynamic> json) =>
    RemoteAnalysisChartByPhase(
      json['execution'] == null
          ? null
          : RemoteLevels.fromJson(json['execution'] as Map<String, dynamic>),
      json['tendring'] == null
          ? null
          : RemoteLevels.fromJson(json['tendring'] as Map<String, dynamic>),
      json['design'] == null
          ? null
          : RemoteLevels.fromJson(json['design'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteAnalysisChartByPhaseToJson(
        RemoteAnalysisChartByPhase instance) =>
    <String, dynamic>{
      'execution': instance.execution,
      'tendring': instance.tendering,
      'design': instance.design,
    };
