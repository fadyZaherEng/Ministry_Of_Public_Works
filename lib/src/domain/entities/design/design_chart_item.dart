import 'dart:math';

import 'package:equatable/equatable.dart';

class DesignChartItem extends Equatable {
  final int? totalDelayLess;
  final int? totalDelayMore;

  const DesignChartItem({
    this.totalDelayLess = 0,
    this.totalDelayMore = 0,
  });

  double get maxValue =>
      max(totalDelayLess?.toDouble() ?? 0.0, totalDelayMore?.toDouble() ?? 0.0);

  @override
  List<Object?> get props => [
        totalDelayLess,
        totalDelayMore,
      ];
}
