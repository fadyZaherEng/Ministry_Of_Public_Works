import 'dart:math';

import 'package:equatable/equatable.dart';

class PackageLevels extends Equatable {
  final int? totalNoLess;
  final int? totalNoBetween;
  final int? totalNoMore;

  const PackageLevels({
    this.totalNoLess = 0,
    this.totalNoBetween = 0,
    this.totalNoMore = 0,
  });

  double get maxValue => max(totalNoLess?.toDouble() ?? 0.0,
      max(totalNoBetween?.toDouble() ?? 0.0, totalNoMore?.toDouble() ?? 0.0));


  @override
  List<Object?> get props => [
        totalNoLess,
        totalNoBetween,
        totalNoMore,
      ];
}
