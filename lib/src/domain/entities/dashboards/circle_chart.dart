import 'package:aim/src/domain/entities/dashboards/series.dart';
import 'package:equatable/equatable.dart';

class CircleChart extends Equatable {
  final double? total;
  final String? color;
  final List<String>? colors;
  final Series? series;

  const CircleChart({
    this.total = 0.0,
    this.color = "",
    this.colors = const [],
    this.series = const Series(),
  });

  @override
  List<Object?> get props => [
        total,
        color,
        colors,
        series,
      ];
}
