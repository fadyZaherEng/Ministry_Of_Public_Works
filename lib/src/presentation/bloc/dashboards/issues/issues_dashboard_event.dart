part of 'issues_dashboard_bloc.dart';

abstract class IssuesDashboardEvent extends Equatable {
  const IssuesDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetIssuesEvent extends IssuesDashboardEvent {
  final IssuesListRequest request;

  const GetIssuesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends IssuesDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends IssuesDashboardEvent {
  const GetSectorsEvent();
}

class SearchIssuesEvent extends IssuesDashboardEvent {
  final String keyword;

  const SearchIssuesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends IssuesDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends IssuesDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends IssuesDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetIssueAnalysisChartBySectorEvent extends IssuesDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetIssueAnalysisChartBySectorEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetIssueAnalysisChartByPhaseEvent extends IssuesDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetIssueAnalysisChartByPhaseEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetIssueCountsEvent extends IssuesDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetIssueCountsEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class NavigateBackEvent extends IssuesDashboardEvent {
  const NavigateBackEvent();
}
