import 'dart:math';

import 'package:equatable/equatable.dart';

class VariationsChartItem extends Equatable {
  final int? lessThan;
  final int? between;
  final int? moreThan;

  const VariationsChartItem({
    this.lessThan = 0,
    this.between = 0,
    this.moreThan = 0,
  });

  double get maxValue => max(lessThan?.toDouble() ?? 0.0,
      max(between?.toDouble() ?? 0.0, moreThan?.toDouble() ?? 0.0));

  @override
  List<Object?> get props => [
    lessThan,
    between,
    moreThan,
      ];
}
