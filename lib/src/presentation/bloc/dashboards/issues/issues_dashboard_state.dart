part of 'issues_dashboard_bloc.dart';

abstract class IssuesDashboardState extends Equatable {
  const IssuesDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class IssuesDashboardInitial extends IssuesDashboardState {}

class ShowLoadingState extends IssuesDashboardState {}

class HideLoadingState extends IssuesDashboardState {}

class GetIssuesSuccessState extends IssuesDashboardState {
  final List<Issue> issues;

  const GetIssuesSuccessState({
    required this.issues,
  });
}

class GetIssuesFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetIssuesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends IssuesDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends IssuesDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchIssuesState extends IssuesDashboardState {
  final String keyword;

  const SearchIssuesState({
    required this.keyword,
  });
}

class SelectSortState extends IssuesDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends IssuesDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends IssuesDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetIssueAnalysisChartBySectorSuccessState extends IssuesDashboardState {
  final AnalysisChartBySector analysisChartBySector;

  const GetIssueAnalysisChartBySectorSuccessState({
    required this.analysisChartBySector,
  });
}

class GetIssueAnalysisChartBySectorFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetIssueAnalysisChartBySectorFailState({
    required this.errorMessage,
  });
}

class GetIssueAnalysisChartByPhaseSuccessState extends IssuesDashboardState {
  final AnalysisChartByPhase analysisChartByPhase;

  const GetIssueAnalysisChartByPhaseSuccessState({
    required this.analysisChartByPhase,
  });
}

class GetIssueAnalysisChartByPhaseFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetIssueAnalysisChartByPhaseFailState({
    required this.errorMessage,
  });
}

class GetIssueCountsSuccessState extends IssuesDashboardState {
  final List<int> counts;

  const GetIssueCountsSuccessState({
    required this.counts,
  });
}

class GetIssueCountsFailState extends IssuesDashboardState {
  final String errorMessage;

  const GetIssueCountsFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends IssuesDashboardState {
  const NavigateBackState();
}
