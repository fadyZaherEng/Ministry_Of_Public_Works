part of 'risks_dashboard_bloc.dart';

abstract class RisksDashboardState extends Equatable {
  const RisksDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class RisksDashboardInitial extends RisksDashboardState {}

class ShowLoadingState extends RisksDashboardState {}

class HideLoadingState extends RisksDashboardState {}

class GetRisksSuccessState extends RisksDashboardState {
  final List<Risk> risks;

  const GetRisksSuccessState({
    required this.risks,
  });
}

class GetRisksFailState extends RisksDashboardState {
  final String errorMessage;

  const GetRisksFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends RisksDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends RisksDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends RisksDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends RisksDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchRisksState extends RisksDashboardState {
  final String keyword;

  const SearchRisksState({
    required this.keyword,
  });
}

class SelectSortState extends RisksDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends RisksDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends RisksDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetRiskAnalysisChartBySectorSuccessState extends RisksDashboardState {
  final AnalysisChartBySector analysisChartBySector;

  const GetRiskAnalysisChartBySectorSuccessState({
    required this.analysisChartBySector,
  });
}

class GetRiskAnalysisChartBySectorFailState extends RisksDashboardState {
  final String errorMessage;

  const GetRiskAnalysisChartBySectorFailState({
    required this.errorMessage,
  });
}

class GetRiskAnalysisChartByPhaseSuccessState extends RisksDashboardState {
  final AnalysisChartByPhase analysisChartByPhase;

  const GetRiskAnalysisChartByPhaseSuccessState({
    required this.analysisChartByPhase,
  });
}

class GetRiskAnalysisChartByPhaseFailState extends RisksDashboardState {
  final String errorMessage;

  const GetRiskAnalysisChartByPhaseFailState({
    required this.errorMessage,
  });
}

class GetRiskCountsSuccessState extends RisksDashboardState {
  final List<int> counts;

  const GetRiskCountsSuccessState({
    required this.counts,
  });
}

class GetRiskCountsFailState extends RisksDashboardState {
  final String errorMessage;

  const GetRiskCountsFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends RisksDashboardState {
  const NavigateBackState();
}
