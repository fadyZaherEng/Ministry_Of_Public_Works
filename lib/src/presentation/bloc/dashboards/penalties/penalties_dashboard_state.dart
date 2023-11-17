part of 'penalties_dashboard_bloc.dart';

abstract class PenaltiesDashboardState extends Equatable {
  const PenaltiesDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PenaltiesDashboardInitial extends PenaltiesDashboardState {}

class ShowLoadingState extends PenaltiesDashboardState {}

class HideLoadingState extends PenaltiesDashboardState {}

class GetPenaltiesSuccessState extends PenaltiesDashboardState {
  final List<Project> penalties;

  const GetPenaltiesSuccessState({
    required this.penalties,
  });
}

class GetPenaltiesFailState extends PenaltiesDashboardState {
  final String errorMessage;

  const GetPenaltiesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends PenaltiesDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends PenaltiesDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends PenaltiesDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends PenaltiesDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchPenaltiesState extends PenaltiesDashboardState {
  final String keyword;

  const SearchPenaltiesState({
    required this.keyword,
  });
}

class SelectSortState extends PenaltiesDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends PenaltiesDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends PenaltiesDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetPenaltyChartDesignSuccessState extends PenaltiesDashboardState {
  final PenaltiesChart penaltiesChart;

  const GetPenaltyChartDesignSuccessState({
    required this.penaltiesChart,
  });
}

class GetPenaltyChartDesignFailState extends PenaltiesDashboardState {
  final String errorMessage;

  const GetPenaltyChartDesignFailState({
    required this.errorMessage,
  });
}

class GetPenaltyChartExecutionSuccessState extends PenaltiesDashboardState {
  final PenaltiesChart penaltiesChart;

  const GetPenaltyChartExecutionSuccessState({
    required this.penaltiesChart,
  });
}

class GetPenaltyChartExecutionFailState extends PenaltiesDashboardState {
  final String errorMessage;

  const GetPenaltyChartExecutionFailState({
    required this.errorMessage,
  });
}

class SelectIndicatorState extends PenaltiesDashboardState {
  final Indicator indicator;

  const SelectIndicatorState({
    required this.indicator,
  });
}

class NavigateBackState extends PenaltiesDashboardState {
  const NavigateBackState();
}
