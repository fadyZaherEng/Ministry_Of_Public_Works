part of 'variations_dashboard_bloc.dart';

abstract class VariationsDashboardEvent extends Equatable {
  const VariationsDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetVariationsEvent extends VariationsDashboardEvent {
  final VariationsListRequest request;

  const GetVariationsEvent({
    required this.request,
  });
}

class GetPhasesEvent extends VariationsDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends VariationsDashboardEvent {
  const GetSectorsEvent();
}

class SearchVariationsEvent extends VariationsDashboardEvent {
  final String keyword;

  const SearchVariationsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends VariationsDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends VariationsDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends VariationsDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetVariationsChartEvent extends VariationsDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetVariationsChartEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class GetVariationsCircleChartEvent extends VariationsDashboardEvent {
  final String phaseId;
  final String sectorId;

  const GetVariationsCircleChartEvent({
    required this.phaseId,
    required this.sectorId,
  });
}

class NavigateBackEvent extends VariationsDashboardEvent {
  const NavigateBackEvent();
}
