import 'package:aim/src/domain/entities/dashboards/variations_chart_item.dart';
import 'package:equatable/equatable.dart';

class VariationsChart extends Equatable {
  final VariationsChartItem? mega;
  final VariationsChartItem? sanitary;
  final VariationsChartItem? construction;

  const VariationsChart({
    this.mega = const VariationsChartItem(),
    this.sanitary = const VariationsChartItem(),
    this.construction = const VariationsChartItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
