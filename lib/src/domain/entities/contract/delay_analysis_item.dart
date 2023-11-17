import 'dart:math';

import 'package:equatable/equatable.dart';

class DelayAnalysisItem extends Equatable {

  final int? ALessThan;
  final int? BBetween;
  final int? CMoreThan;

  const DelayAnalysisItem({
    this.ALessThan = 0,
    this.BBetween = 0,
    this.CMoreThan = 0,
  });

  double get maxValue => max(ALessThan?.toDouble() ?? 0.0,max(BBetween?.toDouble() ?? 0.0,CMoreThan?.toDouble() ?? 0.0));


  @override
  List<Object?> get props => [
    ALessThan,
    BBetween,
    CMoreThan,
  ];
}
