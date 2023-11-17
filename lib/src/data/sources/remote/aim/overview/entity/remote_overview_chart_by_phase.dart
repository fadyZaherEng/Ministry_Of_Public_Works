import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_levels.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_overview_chart_by_phase.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOverviewChartByPhase extends OverviewChartByPhase {
  @JsonKey(name: 'consultancy')
  final RemoteOverviewLevels? design;
  @JsonKey(name: 'tendering')
  final RemoteOverviewLevels? tendering;
  @JsonKey(name: 'execution')
  final RemoteOverviewLevels? execution;

  const RemoteOverviewChartByPhase(
    this.execution,
    this.tendering,
    this.design,
  ) : super(
    execution: execution ?? const Levels(),
    tendering: tendering ?? const Levels(),
    design: design ?? const Levels(),
  );

  factory RemoteOverviewChartByPhase.fromJson(Map<String, dynamic> json) =>
      _$RemoteOverviewChartByPhaseFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOverviewChartByPhaseToJson(this);

}
