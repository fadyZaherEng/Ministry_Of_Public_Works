part of 'analysis_dashboard_bloc.dart';

abstract class AnalysisDashboardEvent extends Equatable {
  const AnalysisDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPhasesEvent extends AnalysisDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends AnalysisDashboardEvent {
  const GetSectorsEvent();
}

class GetYearsEvent extends AnalysisDashboardEvent {
  const GetYearsEvent();
}

class SelectYearEvent extends AnalysisDashboardEvent {
  final Year year;

  const SelectYearEvent({
    required this.year,
  });
}

class SelectPhaseEvent extends AnalysisDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends AnalysisDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetAnalysisModuleListEvent extends AnalysisDashboardEvent {
  final AnalysisListRequest request;

  const GetAnalysisModuleListEvent({
    required this.request,
  });
}

class GetExtensionPeriodEvent extends AnalysisDashboardEvent {
  final String id;
  final int year;

  const GetExtensionPeriodEvent({
    required this.id,
    required this.year,
  });
}

class NavigateBackEvent extends AnalysisDashboardEvent {
  const NavigateBackEvent();
}

