import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:equatable/equatable.dart';

class IssuesData extends Equatable {
  final List<Issue>? issues;
  final int? recordsTotal;

  const IssuesData({
    this.issues = const [],
    this.recordsTotal = 0,
  });

  @override
  List<Object?> get props => [
        issues,
        recordsTotal,
      ];
}
