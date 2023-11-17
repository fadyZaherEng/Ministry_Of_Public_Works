part of 'variations_dashboard_bloc.dart';

abstract class VariationsDashboardState extends Equatable {
  const VariationsDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class VariationsDashboardInitial extends VariationsDashboardState {}

class ShowLoadingState extends VariationsDashboardState {}

class HideLoadingState extends VariationsDashboardState {}

class GetVariationsSuccessState extends VariationsDashboardState {
  final List<Variation> variations;

  const GetVariationsSuccessState({
    required this.variations,
  });
}

class GetVariationsFailState extends VariationsDashboardState {
  final String errorMessage;

  const GetVariationsFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends VariationsDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends VariationsDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends VariationsDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends VariationsDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchVariationsState extends VariationsDashboardState {
  final String keyword;

  const SearchVariationsState({
    required this.keyword,
  });
}

class SelectSortState extends VariationsDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends VariationsDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends VariationsDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetVariationsChartSuccessState extends VariationsDashboardState {
  final VariationsChart variationsChart;

  const GetVariationsChartSuccessState({
    required this.variationsChart,
  });
}

class GetVariationsChartFailState extends VariationsDashboardState {
  final String errorMessage;

  const GetVariationsChartFailState({
    required this.errorMessage,
  });
}

class GetVariationsCircleChartSuccessState extends VariationsDashboardState {
  final CircleChart circleChart;

  const GetVariationsCircleChartSuccessState({
    required this.circleChart,
  });
}

class GetVariationsCircleChartFailState extends VariationsDashboardState {
  final String errorMessage;

  const GetVariationsCircleChartFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends VariationsDashboardState {
  const NavigateBackState();
}
