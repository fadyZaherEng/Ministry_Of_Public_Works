import 'package:aim/src/domain/entities/dashboards/penalties_chart_item.dart';
import 'package:equatable/equatable.dart';

class PenaltiesChart extends Equatable {
  final PenaltiesChartItem? mega;
  final PenaltiesChartItem? sanitary;
  final PenaltiesChartItem? construction;

  const PenaltiesChart({
    this.mega = const PenaltiesChartItem(),
    this.sanitary = const PenaltiesChartItem(),
    this.construction = const PenaltiesChartItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
