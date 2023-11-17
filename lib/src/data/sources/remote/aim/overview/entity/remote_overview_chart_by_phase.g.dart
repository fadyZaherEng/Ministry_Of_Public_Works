// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_overview_chart_by_phase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteOverviewChartByPhase _$RemoteOverviewChartByPhaseFromJson(
        Map<String, dynamic> json) =>
    RemoteOverviewChartByPhase(
      json['execution'] == null
          ? null
          : RemoteOverviewLevels.fromJson(
              json['execution'] as Map<String, dynamic>),
      json['tendering'] == null
          ? null
          : RemoteOverviewLevels.fromJson(
              json['tendering'] as Map<String, dynamic>),
      json['consultancy'] == null
          ? null
          : RemoteOverviewLevels.fromJson(
              json['consultancy'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RemoteOverviewChartByPhaseToJson(
        RemoteOverviewChartByPhase instance) =>
    <String, dynamic>{
      'consultancy': instance.design,
      'tendering': instance.tendering,
      'execution': instance.execution,
    };
