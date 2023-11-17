import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:equatable/equatable.dart';

class OverviewData extends Equatable {
  final List<Overview>? overviews;
  final int? recordsTotal;

  const OverviewData({
    this.overviews = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
    overviews,
        recordsTotal,
      ];
}
