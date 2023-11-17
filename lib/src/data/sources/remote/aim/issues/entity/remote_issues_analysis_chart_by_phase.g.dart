// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_issues_analysis_chart_by_phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteIssuesAnalysisChartByPhase _$RemoteIssuesAnalysisChartByPhaseFromJson(
        Map<String, dynamic> json) =>
    RemoteIssuesAnalysisChartByPhase(
      json['execution'] == null
          ? null
          : RemoteIssuesPhaseLevels.fromJson(
              json['execution'] as Map<String, dynamic>),
      json['tendring'] == null
          ? null
          : RemoteIssuesPhaseLevels.fromJson(
              json['tendring'] as Map<String, dynamic>),
      json['design'] == null
          ? null
          : RemoteIssuesPhaseLevels.fromJson(
              json['design'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteIssuesAnalysisChartByPhaseToJson(
        RemoteIssuesAnalysisChartByPhase instance) =>
    <String, dynamic>{
      'execution': instance.execution,
      'tendring': instance.tendering,
      'design': instance.design,
    };
