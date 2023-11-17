import 'dart:math';

import 'package:equatable/equatable.dart';

class Levels extends Equatable {
  final int? low;
  final int? meduim;
  final int? high;

  const Levels({
    this.low = 0,
    this.meduim = 0,
    this.high = 0,
  });

  double get maxValue => max(low?.toDouble() ?? 0.0,
      max(meduim?.toDouble() ?? 0.0, high?.toDouble() ?? 0.0));

  @override
  List<Object?> get props => [
        low,
        meduim,
        high,
      ];
}
