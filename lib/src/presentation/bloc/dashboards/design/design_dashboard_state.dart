part of 'design_dashboard_bloc.dart';

abstract class DesignDashboardState extends Equatable {
  const DesignDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class DesignDashboardInitial extends DesignDashboardState {}

class ShowLoadingState extends DesignDashboardState {}

class HideLoadingState extends DesignDashboardState {}

class GetDesignsSuccessState extends DesignDashboardState {
  final List<Design> designs;

  const GetDesignsSuccessState({
    required this.designs,
  });
}

class GetDesignsFailState extends DesignDashboardState {
  final String errorMessage;

  const GetDesignsFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends DesignDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends DesignDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends DesignDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends DesignDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchDesignState extends DesignDashboardState {
  final String keyword;

  const SearchDesignState({
    required this.keyword,
  });
}

class SelectSortState extends DesignDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends DesignDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends DesignDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetDesignChartSuccessState extends DesignDashboardState {
  final DesignChart designChart;

  const GetDesignChartSuccessState({
    required this.designChart,
  });
}

class GetDesignChartFailState extends DesignDashboardState {
  final String errorMessage;

  const GetDesignChartFailState({
    required this.errorMessage,
  });
}

class GetDesignMinistrySuccessState extends DesignDashboardState {
  final CircleChart circleChart;

  const GetDesignMinistrySuccessState({
    required this.circleChart,
  });
}

class GetDesignMinistryFailState extends DesignDashboardState {
  final String errorMessage;

  const GetDesignMinistryFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends DesignDashboardState {
  const NavigateBackState();
}
