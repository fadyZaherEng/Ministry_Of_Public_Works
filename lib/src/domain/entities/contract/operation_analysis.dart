import 'package:aim/src/domain/entities/contract/operation_analysis_item.dart';
import 'package:equatable/equatable.dart';

class OperationAnalysis extends Equatable {
  final OperationAnalysisItem? sanitary;

  const OperationAnalysis({
    this.sanitary = const OperationAnalysisItem(),
  });

  @override
  List<Object?> get props => [
        sanitary,
      ];
}
