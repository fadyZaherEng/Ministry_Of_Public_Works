import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:equatable/equatable.dart';

class ReportsData extends Equatable {
  final List<Report>? reports;
  final int? recordsTotal;

  const ReportsData({
    this.reports = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        reports,
        recordsTotal,
      ];
}
