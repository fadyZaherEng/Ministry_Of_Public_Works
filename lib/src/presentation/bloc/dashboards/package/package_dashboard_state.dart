part of 'package_dashboard_bloc.dart';

abstract class PackageDashboardState extends Equatable {
  const PackageDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PackageDashboardInitial extends PackageDashboardState {}

class ShowLoadingState extends PackageDashboardState {}

class HideLoadingState extends PackageDashboardState {}

class GetPackagesSuccessState extends PackageDashboardState {
  final List<Package> packages;

  const GetPackagesSuccessState({
    required this.packages,
  });
}

class GetPackagesFailState extends PackageDashboardState {
  final String errorMessage;

  const GetPackagesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends PackageDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends PackageDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends PackageDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends PackageDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchPackagesState extends PackageDashboardState {
  final String keyword;

  const SearchPackagesState({
    required this.keyword,
  });
}

class SelectSortState extends PackageDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends PackageDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectIndicatorState extends PackageDashboardState {
  final Indicator indicator;

  const SelectIndicatorState({
    required this.indicator,
  });
}

class SelectSectorState extends PackageDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class GetPackageAnalysisCharSuccessState extends PackageDashboardState {
  final PackageAnalysisChart packageAnalysisChart;

  const GetPackageAnalysisCharSuccessState({
    required this.packageAnalysisChart,
  });
}

class GetPackageAnalysisCharFailState extends PackageDashboardState {
  final String errorMessage;

  const GetPackageAnalysisCharFailState({
    required this.errorMessage,
  });
}

class GetPackageMinistryChartSuccessState extends PackageDashboardState {
  final PackageCircleChart packageCircleChart;

  const GetPackageMinistryChartSuccessState({
    required this.packageCircleChart,
  });
}

class GetPackageMinistryChartFailState extends PackageDashboardState {
  final String errorMessage;

  const GetPackageMinistryChartFailState({
    required this.errorMessage,
  });
}

class GetIssueCountsSuccessState extends PackageDashboardState {
  final List<int> counts;

  const GetIssueCountsSuccessState({
    required this.counts,
  });
}

class GetIssueCountsFailState extends PackageDashboardState {
  final String errorMessage;

  const GetIssueCountsFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends PackageDashboardState {
  const NavigateBackState();
}
