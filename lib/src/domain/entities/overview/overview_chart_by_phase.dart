import 'package:aim/src/domain/entities/dashboards/levels.dart';
import 'package:equatable/equatable.dart';

class OverviewChartByPhase extends Equatable {
  final Levels? execution;
  final Levels? tendering;
  final Levels? design;

  const OverviewChartByPhase({
    this.execution = const Levels(),
    this.tendering = const Levels(),
    this.design = const Levels(),
  });

  @override
  List<Object?> get props => [
        execution,
        tendering,
        design,
      ];
}
