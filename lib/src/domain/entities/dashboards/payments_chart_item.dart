import 'dart:math';

import 'package:equatable/equatable.dart';

class PaymentsChartItem extends Equatable {
  final int? lessThan;
  final int? moreThan;

  const PaymentsChartItem({
    this.lessThan = 0,
    this.moreThan = 0,
  });

  double get maxValue =>
      max(lessThan?.toDouble() ?? 0.0, moreThan?.toDouble() ?? 0.0);

  @override
  List<Object?> get props => [
        lessThan,
        moreThan,
      ];
}
