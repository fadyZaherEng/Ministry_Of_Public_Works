part of 'design_dashboard_bloc.dart';

abstract class DesignDashboardEvent extends Equatable {
  const DesignDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetDesignsEvent extends DesignDashboardEvent {
  final DesignListRequest request;

  const GetDesignsEvent({
    required this.request,
  });
}

class GetPhasesEvent extends DesignDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends DesignDashboardEvent {
  const GetSectorsEvent();
}

class SearchDesignEvent extends DesignDashboardEvent {
  final String keyword;

  const SearchDesignEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends DesignDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends DesignDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectSectorEvent extends DesignDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetDesignChartEvent extends DesignDashboardEvent {
  final String sectorId;

  const GetDesignChartEvent({
    required this.sectorId,
  });
}

class GetDesignMinistryEvent extends DesignDashboardEvent {
  final String sectorId;

  const GetDesignMinistryEvent({
    required this.sectorId,
  });
}

class NavigateBackEvent extends DesignDashboardEvent {
  const NavigateBackEvent();
}
