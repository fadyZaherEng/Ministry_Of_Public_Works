import 'package:aim/src/domain/entities/design/design_chart_item.dart';
import 'package:equatable/equatable.dart';

class DesignChart extends Equatable {
  final DesignChartItem? mega;
  final DesignChartItem? sanitary;
  final DesignChartItem? construction;

  const DesignChart({
    this.mega = const DesignChartItem(),
    this.sanitary = const DesignChartItem(),
    this.construction = const DesignChartItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
