import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:equatable/equatable.dart';

class PenaltiesData extends Equatable {
  final List<Penalty>? penalties;
  final int? recordsTotal;

  const PenaltiesData({
    this.penalties = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        penalties,
        recordsTotal,
      ];
}
