part of 'overview_dashboard_bloc.dart';

abstract class OverviewDashboardEvent extends Equatable {
  const OverviewDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetOverviewEvent extends OverviewDashboardEvent {
  final OverviewListRequest request;

  const GetOverviewEvent({
    required this.request,
  });
}

class GetPhasesEvent extends OverviewDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends OverviewDashboardEvent {
  const GetSectorsEvent();
}

class SearchOverviewEvent extends OverviewDashboardEvent {
  final String keyword;

  const SearchOverviewEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends OverviewDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends OverviewDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends OverviewDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetOverviewProjectsByPhaseEvent extends OverviewDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetOverviewProjectsByPhaseEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetOverviewProjectsBySectorEvent extends OverviewDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetOverviewProjectsBySectorEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetProjectsInProgressEvent extends OverviewDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetProjectsInProgressEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetOverviewCardsEvent extends OverviewDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetOverviewCardsEvent({
    required this.phaseId,
    required this.sectorId,
  });
}


class GetUserPermissionEvent extends OverviewDashboardEvent {
  const GetUserPermissionEvent();
}

class NavigateBackEvent extends OverviewDashboardEvent {
  const NavigateBackEvent();
}
