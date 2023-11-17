import 'package:aim/src/data/sources/remote/aim/variation/entity/remote_variation_series.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_variation_circle_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemoteVariationCircleChart extends CircleChart {
  @JsonKey(name: 'variationTotal')
  final double? total;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'colors')
  final List<String>? colors;
  @JsonKey(name: 'series')
  final RemoteVariationSeries? series;

  const RemoteVariationCircleChart(
    this.total,
    this.color,
    this.colors,
    this.series,
  ) : super(
          total: total ?? 0.0,
          color: color ?? "",
          colors: colors ?? const [],
          series: series ?? const Series(),
        );

  factory RemoteVariationCircleChart.fromJson(Map<String, dynamic> json) =>
      _$RemoteVariationCircleChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemoteVariationCircleChartToJson(this);
}
