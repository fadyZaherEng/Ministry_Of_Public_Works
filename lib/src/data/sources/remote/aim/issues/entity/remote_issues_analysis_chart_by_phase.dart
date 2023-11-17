import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issues_phase_levels.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issues_analysis_chart_by_phase.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssuesAnalysisChartByPhase extends AnalysisChartByPhase {
  @JsonKey(name: 'execution')
  final RemoteIssuesPhaseLevels? execution;
  @JsonKey(name: 'tendring')
  final RemoteIssuesPhaseLevels? tendering;
  @JsonKey(name: 'design')
  final RemoteIssuesPhaseLevels? design;

  const RemoteIssuesAnalysisChartByPhase(
    this.execution,
    this.tendering,
    this.design,
  ) : super(
    execution: execution ?? const Levels(),
    tendering: tendering ?? const Levels(),
    design: design ?? const Levels(),
  );

  factory RemoteIssuesAnalysisChartByPhase.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssuesAnalysisChartByPhaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssuesAnalysisChartByPhaseToJson(this);

}
