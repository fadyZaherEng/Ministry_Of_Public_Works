part of 'penalties_dashboard_bloc.dart';

abstract class PenaltiesDashboardEvent extends Equatable {
  const PenaltiesDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPenaltiesEvent extends PenaltiesDashboardEvent {
  final PenaltiesListRequest request;

  const GetPenaltiesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends PenaltiesDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends PenaltiesDashboardEvent {
  const GetSectorsEvent();
}

class SearchPenaltiesEvent extends PenaltiesDashboardEvent {
  final String keyword;

  const SearchPenaltiesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends PenaltiesDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends PenaltiesDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends PenaltiesDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class SelectIndicatorEvent extends PenaltiesDashboardEvent {
  final Indicator indicator;

  const SelectIndicatorEvent({
    required this.indicator,
  });
}

class GetPenaltyChartDesignEvent extends PenaltiesDashboardEvent {
  final String sectorId;
  final int color;

  const GetPenaltyChartDesignEvent({
    required this.sectorId,
    required this.color,
  });
}

class GetPenaltyChartExecutionEvent extends PenaltiesDashboardEvent {
  final String sectorId;
  final int color;

  const GetPenaltyChartExecutionEvent({
    required this.sectorId,
    required this.color,
  });
}


class NavigateBackEvent extends PenaltiesDashboardEvent {
  const NavigateBackEvent();
}
