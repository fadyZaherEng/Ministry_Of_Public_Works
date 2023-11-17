import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_levels.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_analysis_chart_by_phase.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAnalysisChartByPhase extends AnalysisChartByPhase {
  @JsonKey(name: 'execution')
  final RemoteLevels? execution;
  @JsonKey(name: 'tendring')
  final RemoteLevels? tendering;
  @JsonKey(name: 'design')
  final RemoteLevels? design;

  const RemoteAnalysisChartByPhase(
    this.execution,
    this.tendering,
    this.design,
  ) : super(
    execution: execution ?? const Levels(),
    tendering: tendering ?? const Levels(),
    design: design ?? const Levels(),
  );

  factory RemoteAnalysisChartByPhase.fromJson(Map<String, dynamic> json) =>
      _$RemoteAnalysisChartByPhaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAnalysisChartByPhaseToJson(this);

}
