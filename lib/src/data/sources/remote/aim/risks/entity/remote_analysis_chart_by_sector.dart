import 'package:aim/src/data/sources/remote/aim/risks/entity/remote_levels.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_analysis_chart_by_sector.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteAnalysisChartBySector extends AnalysisChartBySector {
  @JsonKey(name: 'mega')
  final RemoteLevels? mega;
  @JsonKey(name: 'sanitary')
  final RemoteLevels? sanitary;
  @JsonKey(name: 'construction')
  final RemoteLevels? construction;

  const RemoteAnalysisChartBySector(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
    mega: mega ?? const Levels(),
    sanitary: sanitary ?? const Levels(),
    construction: construction ?? const Levels(),
  );

  factory RemoteAnalysisChartBySector.fromJson(Map<String, dynamic> json) =>
      _$RemoteAnalysisChartBySectorFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteAnalysisChartBySectorToJson(this);

}
