import 'package:aim/src/domain/entities/package/package_series.dart';
import 'package:equatable/equatable.dart';

class PackageCircleChart extends Equatable {
  final double? total;
  final String? color;
  final List<String>? colors;
  final PackageSeries? series;

  const PackageCircleChart({
    this.total = 0.0,
    this.color = "",
    this.colors = const [],
    this.series = const PackageSeries(),
  });

  @override
  List<Object?> get props => [
        total,
        color,
        colors,
        series,
      ];
}
