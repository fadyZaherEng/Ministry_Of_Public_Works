part of 'analysis_dashboard_bloc.dart';

abstract class AnalysisDashboardState extends Equatable {
  const AnalysisDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class AnalysisInitial extends AnalysisDashboardState {}

class ShowLoadingState extends AnalysisDashboardState {}

class HideLoadingState extends AnalysisDashboardState {}

class GetAnalysisModuleListSuccessState extends AnalysisDashboardState {
  final List<Analysis> analysis;

  const GetAnalysisModuleListSuccessState({
    required this.analysis,
  });
}

class GetAnalysisModuleListFailState extends AnalysisDashboardState {
  final String errorMessage;

  const GetAnalysisModuleListFailState({
    required this.errorMessage,
  });
}

class GetExtensionPeriodSuccessState extends AnalysisDashboardState {
  final List<ExtensionItem> extensionItems;

  const GetExtensionPeriodSuccessState({
    required this.extensionItems,
  });
}

class GetExtensionPeriodFailState extends AnalysisDashboardState {
  final String errorMessage;

  const GetExtensionPeriodFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends AnalysisDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends AnalysisDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}


class GetYearsSuccessState extends AnalysisDashboardState {
  final List<Year> years;

  const GetYearsSuccessState({
    required this.years,
  });
}

class GetYearsFailState extends AnalysisDashboardState {
  final String errorMessage;

  const GetYearsFailState({
    required this.errorMessage,
  });
}



class GetSectorsSuccessState extends AnalysisDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends AnalysisDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SelectPhaseState extends AnalysisDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends AnalysisDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class SelectYearState extends AnalysisDashboardState {
  final Year year;

  const SelectYearState({required this.year});
}

class NavigateBackState extends AnalysisDashboardState {
  const NavigateBackState();
}
