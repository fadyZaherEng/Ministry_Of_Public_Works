import 'package:aim/src/data/sources/remote/aim/overview/entity/remote_overview_levels.dart';
import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_overview_chart_by_sector.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteOverviewChartBySector extends OverviewChartBySector {
  @JsonKey(name: 'mega')
  final RemoteOverviewLevels? mega;
  @JsonKey(name: 'sanitary')
  final RemoteOverviewLevels? sanitary;
  @JsonKey(name: 'construction')
  final RemoteOverviewLevels? construction;

  const RemoteOverviewChartBySector(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
    mega: mega ?? const Levels(),
    sanitary: sanitary ?? const Levels(),
    construction: construction ?? const Levels(),
  );

  factory RemoteOverviewChartBySector.fromJson(Map<String, dynamic> json) =>
      _$RemoteOverviewChartBySectorFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteOverviewChartBySectorToJson(this);

}
