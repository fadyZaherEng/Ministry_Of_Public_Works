import 'dart:math';

import 'package:equatable/equatable.dart';

class PenaltiesChartItem extends Equatable {
  final int? noPenalty;
  final int? lessThanTen;
  final int? moreThanTen;

  const PenaltiesChartItem({
    this.noPenalty = 0,
    this.lessThanTen = 0,
    this.moreThanTen = 0,
  });

  double get maxValue => max(noPenalty?.toDouble() ?? 0.0,
      max(lessThanTen?.toDouble() ?? 0.0, moreThanTen?.toDouble() ?? 0.0));


  @override
  List<Object?> get props => [
        noPenalty,
        lessThanTen,
        moreThanTen,
      ];
}
