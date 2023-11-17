import 'package:aim/src/data/sources/remote/aim/issues/entity/remote_issues_levels.dart';
import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_levels.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_issues_analysis_chart_by_sector.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteIssuesAnalysisChartBySector extends AnalysisChartBySector {
  @JsonKey(name: 'mega')
  final RemoteIssuesLevels? mega;
  @JsonKey(name: 'sanitary')
  final RemoteIssuesLevels? sanitary;
  @JsonKey(name: 'construction')
  final RemoteIssuesLevels? construction;

  const RemoteIssuesAnalysisChartBySector(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
    mega: mega ?? const Levels(),
    sanitary: sanitary ?? const Levels(),
    construction: construction ?? const Levels(),
  );

  factory RemoteIssuesAnalysisChartBySector.fromJson(Map<String, dynamic> json) =>
      _$RemoteIssuesAnalysisChartBySectorFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteIssuesAnalysisChartBySectorToJson(this);

}
