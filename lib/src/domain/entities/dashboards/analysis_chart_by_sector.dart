import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:equatable/equatable.dart';

class AnalysisChartBySector extends Equatable {
  final Levels? mega;
  final Levels? sanitary;
  final Levels? construction;

  const AnalysisChartBySector({
    this.mega = const Levels(),
    this.sanitary = const Levels(),
    this.construction = const Levels(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
