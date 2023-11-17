import 'dart:math';

import 'package:equatable/equatable.dart';

class ApprovedAnalysisItem extends Equatable {
  final int? approved;
  final int? notApproved;

  const ApprovedAnalysisItem({
    this.approved = 0,
    this.notApproved = 0,
  });

  double get maxValue => max(approved?.toDouble() ?? 0.0,notApproved?.toDouble() ?? 0.0);

  @override
  List<Object?> get props => [
    approved,
    notApproved,
  ];
}
