import 'package:aim/src/domain/entities/contract/delay_analysis_item.dart';
import 'package:equatable/equatable.dart';

class DelayAnalysis extends Equatable {
  final DelayAnalysisItem? mega;
  final DelayAnalysisItem? sanitary;
  final DelayAnalysisItem? construction;

  const DelayAnalysis({
    this.mega = const DelayAnalysisItem(),
    this.sanitary = const DelayAnalysisItem(),
    this.construction = const DelayAnalysisItem(),
  });

  @override
  List<Object?> get props => [
        mega,
        sanitary,
        construction,
      ];
}
