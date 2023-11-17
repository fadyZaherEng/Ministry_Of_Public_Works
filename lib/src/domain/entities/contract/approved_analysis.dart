import 'package:aim/src/domain/entities/contract/approve_analysis_item.dart';
import 'package:equatable/equatable.dart';

class ApprovedAnalysis extends Equatable {
  final ApprovedAnalysisItem? mega;
  final ApprovedAnalysisItem? sanitary;
  final ApprovedAnalysisItem? construction;

  const ApprovedAnalysis({
    this.mega = const ApprovedAnalysisItem(),
    this.sanitary = const ApprovedAnalysisItem(),
    this.construction = const ApprovedAnalysisItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
