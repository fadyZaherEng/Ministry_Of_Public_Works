import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:equatable/equatable.dart';

class AnalysisData extends Equatable {
  final List<Analysis>? analysis;
  final int? recordsTotal;

  const AnalysisData({
    this.analysis = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        analysis,
        recordsTotal,
      ];
}
