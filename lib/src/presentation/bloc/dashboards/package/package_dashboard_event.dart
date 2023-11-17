part of 'package_dashboard_bloc.dart';

abstract class PackageDashboardEvent extends Equatable {
  const PackageDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPackagesEvent extends PackageDashboardEvent {
  final PackageListRequest request;

  const GetPackagesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends PackageDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends PackageDashboardEvent {
  const GetSectorsEvent();
}

class SearchPackagesEvent extends PackageDashboardEvent {
  final String keyword;

  const SearchPackagesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends PackageDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends PackageDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectIndicatorEvent extends PackageDashboardEvent {
  final Indicator indicator;

  const SelectIndicatorEvent({
    required this.indicator,
  });
}

class SelectSectorEvent extends PackageDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetPackageAnalysisChartEvent extends PackageDashboardEvent {
  final String sectorId;
  final int color;

  const GetPackageAnalysisChartEvent({
    required this.sectorId,
    required this.color,
  });
}

class GetPackageMinistryChartEvent extends PackageDashboardEvent {
  final String sectorId;
  final int color;

  const GetPackageMinistryChartEvent({
    required this.sectorId,
    required this.color,
  });
}

class NavigateBackEvent extends PackageDashboardEvent {
  const NavigateBackEvent();
}
