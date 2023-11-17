part of 'risks_dashboard_bloc.dart';

abstract class RisksDashboardEvent extends Equatable {
  const RisksDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetRisksEvent extends RisksDashboardEvent {
  final RisksListRequest request;

  const GetRisksEvent({
    required this.request,
  });
}

class GetPhasesEvent extends RisksDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends RisksDashboardEvent {
  const GetSectorsEvent();
}

class SearchRisksEvent extends RisksDashboardEvent {
  final String keyword;

  const SearchRisksEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends RisksDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends RisksDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends RisksDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetRiskAnalysisChartBySectorEvent extends RisksDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetRiskAnalysisChartBySectorEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetRiskAnalysisChartByPhaseEvent extends RisksDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetRiskAnalysisChartByPhaseEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetRiskCountsEvent extends RisksDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetRiskCountsEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class NavigateBackEvent extends RisksDashboardEvent {
  const NavigateBackEvent();
}
