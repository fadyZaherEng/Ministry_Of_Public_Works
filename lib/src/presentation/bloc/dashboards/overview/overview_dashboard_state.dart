part of 'overview_dashboard_bloc.dart';

abstract class OverviewDashboardState extends Equatable {
  const OverviewDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class OverviewDashboardInitial extends OverviewDashboardState {}

class ShowLoadingState extends OverviewDashboardState {}

class HideLoadingState extends OverviewDashboardState {}

class GetOverviewSuccessState extends OverviewDashboardState {
  final List<Overview> overviews;

  const GetOverviewSuccessState({
    required this.overviews,
  });
}

class GetOverviewFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetOverviewFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends OverviewDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends OverviewDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchOverviewState extends OverviewDashboardState {
  final String keyword;

  const SearchOverviewState({
    required this.keyword,
  });
}

class SelectSortState extends OverviewDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends OverviewDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends OverviewDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetOverviewProjectsByPhaseSuccessState extends OverviewDashboardState {
  final OverviewChartByPhase overviewChartByPhase;

  const GetOverviewProjectsByPhaseSuccessState({
    required this.overviewChartByPhase,
  });
}

class GetOverviewProjectsByPhaseFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetOverviewProjectsByPhaseFailState({
    required this.errorMessage,
  });
}

class GetOverviewProjectsBySectorSuccessState extends OverviewDashboardState {
  final OverviewChartBySector overviewChartBySector;

  const GetOverviewProjectsBySectorSuccessState({
    required this.overviewChartBySector,
  });
}

class GetOverviewProjectsBySectorFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetOverviewProjectsBySectorFailState({
    required this.errorMessage,
  });
}

class GetOverviewCardsSuccessState extends OverviewDashboardState {
  final List<String> cards;

  const GetOverviewCardsSuccessState({
    required this.cards,
  });
}

class GetOverviewCardsFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetOverviewCardsFailState({
    required this.errorMessage,
  });
}

class GetProjectsInProgressSuccessState extends OverviewDashboardState {
  final int projects;

  const GetProjectsInProgressSuccessState({
    required this.projects,
  });
}

class GetProjectsInProgressFailState extends OverviewDashboardState {
  final String errorMessage;

  const GetProjectsInProgressFailState({
    required this.errorMessage,
  });
}

class GetUserPermissionState extends OverviewDashboardState {
  final String permission;

  const GetUserPermissionState({
    required this.permission,
  });
}

class NavigateBackState extends OverviewDashboardState {
  const NavigateBackState();
}
