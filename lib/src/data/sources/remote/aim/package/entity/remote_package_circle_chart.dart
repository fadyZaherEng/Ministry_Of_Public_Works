import 'package:aim/src/data/sources/remote/aim/package/entity/remote_package_sereis.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/domain/entities/package/package_series.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_package_circle_chart.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class RemotePackageCircleChart extends PackageCircleChart {
  @JsonKey(name: 'totalNOPer')
  final double? total;
  @JsonKey(name: 'color')
  final String? color;
  @JsonKey(name: 'colors')
  final List<String>? colors;
  @JsonKey(name: 'series')
  final RemotePackageSeries? series;

  const RemotePackageCircleChart(
    this.total,
    this.color,
    this.colors,
    this.series,
  ) : super(
          total: total ?? 0.0,
          color: color ?? "",
          colors: colors ?? const [],
          series: series ?? const PackageSeries(),
        );

  factory RemotePackageCircleChart.fromJson(Map<String, dynamic> json) =>
      _$RemotePackageCircleChartFromJson(json);

  Map<String, dynamic> toJson() => _$RemotePackageCircleChartToJson(this);
}
