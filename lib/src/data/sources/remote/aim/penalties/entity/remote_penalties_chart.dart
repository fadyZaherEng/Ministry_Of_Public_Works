import 'package:aim/src/data/sources/remote/aim/penalties/entity/remote_penalties_chart_item.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_penalties_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePenaltiesChart extends PenaltiesChart {
  @JsonKey(name: 'mega')
  final RemotePenaltiesChartItem? mega;
  @JsonKey(name: 'sanitary')
  final RemotePenaltiesChartItem? sanitary;
  @JsonKey(name: 'construction')
  final RemotePenaltiesChartItem? construction;

  const RemotePenaltiesChart(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
          mega: mega ?? const PenaltiesChartItem(),
          sanitary: sanitary ?? const PenaltiesChartItem(),
          construction: construction ?? const PenaltiesChartItem(),
        );

  factory RemotePenaltiesChart.fromJson(Map<String, dynamic> json) =>
      _$RemotePenaltiesChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePenaltiesChartToJson(this);
}
