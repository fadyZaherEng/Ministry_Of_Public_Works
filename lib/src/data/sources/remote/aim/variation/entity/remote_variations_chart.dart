import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variations_chart_item.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variations_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariationsChart extends VariationsChart {
  @JsonKey(name: 'mega')
  final RemoteVariationsChartItem? mega;
  @JsonKey(name: 'sanitary')
  final RemoteVariationsChartItem? sanitary;
  @JsonKey(name: 'construction')
  final RemoteVariationsChartItem? construction;

  const RemoteVariationsChart(
    this.mega,
    this.sanitary,
    this.construction,
  ) : super(
          mega: mega ?? const VariationsChartItem(),
          sanitary: sanitary ?? const VariationsChartItem(),
          construction: construction ?? const VariationsChartItem(),
        );

  factory RemoteVariationsChart.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationsChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationsChartToJson(this);
}
