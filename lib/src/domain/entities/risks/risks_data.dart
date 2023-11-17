import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:equatable/equatable.dart';

class RisksData extends Equatable {
  final List<Risk>? risks;
  final int? recordsTotal;

  const RisksData({
    this.risks = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        risks,
        recordsTotal,
      ];
}
