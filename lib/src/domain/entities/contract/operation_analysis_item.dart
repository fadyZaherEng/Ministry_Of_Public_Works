import 'package:equatable/equatable.dart';

class OperationAnalysisItem extends Equatable {

  final int? ALessThan;
  final int? BBetween;
  final int? CMoreThan;

  const OperationAnalysisItem({
    this.ALessThan = 0,
    this.BBetween = 0,
    this.CMoreThan = 0,
  });

  @override
  List<Object?> get props => [
    ALessThan,
    BBetween,
    CMoreThan,
  ];
}
