part of 'payments_dashboard_bloc.dart';

abstract class PaymentsDashboardEvent extends Equatable {
  const PaymentsDashboardEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPaymentsEvent extends PaymentsDashboardEvent {
  final PaymentsListRequest request;

  const GetPaymentsEvent({
    required this.request,
  });
}

class GetPhasesEvent extends PaymentsDashboardEvent {
  const GetPhasesEvent();
}

class GetSectorsEvent extends PaymentsDashboardEvent {
  const GetSectorsEvent();
}

class SearchPaymentsEvent extends PaymentsDashboardEvent {
  final String keyword;

  const SearchPaymentsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends PaymentsDashboardEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends PaymentsDashboardEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}
class SelectIndicatorEvent extends PaymentsDashboardEvent {
  final Indicator indicator;

  const SelectIndicatorEvent({
    required this.indicator,
  });
}

class SelectSectorEvent extends PaymentsDashboardEvent {
  final ProjectType sector;

  const SelectSectorEvent({
    required this.sector,
  });
}

class GetPaymentsChartEvent extends PaymentsDashboardEvent {
  final String phaseId;
  final String sectorId;
  final int color;

  const GetPaymentsChartEvent({
    required this.phaseId,
    required this.sectorId,
    required this.color,
  });
}

class NavigateBackEvent extends PaymentsDashboardEvent {
  const NavigateBackEvent();
}
