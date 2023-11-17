import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:equatable/equatable.dart';

class MilestonesData extends Equatable {
  final List<Milestone>? milestones;
  final int? recordsTotal;

  const MilestonesData({
    this.milestones = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        milestones,
        recordsTotal,
      ];
}
