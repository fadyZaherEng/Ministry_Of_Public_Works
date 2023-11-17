part of 'payments_dashboard_bloc.dart';

abstract class PaymentsDashboardState extends Equatable {
  const PaymentsDashboardState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PaymentsDashboardInitial extends PaymentsDashboardState {}

class ShowLoadingState extends PaymentsDashboardState {}

class HideLoadingState extends PaymentsDashboardState {}

class GetPaymentsSuccessState extends PaymentsDashboardState {
  final List<Payment> payments;

  const GetPaymentsSuccessState({
    required this.payments,
  });
}

class GetPaymentsFailState extends PaymentsDashboardState {
  final String errorMessage;

  const GetPaymentsFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends PaymentsDashboardState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends PaymentsDashboardState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetSectorsSuccessState extends PaymentsDashboardState {
  final List<ProjectType> sectors;

  const GetSectorsSuccessState({
    required this.sectors,
  });
}

class GetSectorsFailState extends PaymentsDashboardState {
  final String errorMessage;

  const GetSectorsFailState({
    required this.errorMessage,
  });
}

class SearchPaymentsState extends PaymentsDashboardState {
  final String keyword;

  const SearchPaymentsState({
    required this.keyword,
  });
}

class SelectSortState extends PaymentsDashboardState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends PaymentsDashboardState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectSectorState extends PaymentsDashboardState {
  final ProjectType sector;

  const SelectSectorState({
    required this.sector,
  });
}

class SelectIndicatorState extends PaymentsDashboardState {
  final Indicator indicator;

  const SelectIndicatorState({
    required this.indicator,
  });
}

class GetPaymentsChartSuccessState extends PaymentsDashboardState {
  final PaymentsChart paymentsChart;

  const GetPaymentsChartSuccessState({
    required this.paymentsChart,
  });
}

class GetPaymentsChartFailState extends PaymentsDashboardState {
  final String errorMessage;

  const GetPaymentsChartFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends PaymentsDashboardState {
  const NavigateBackState();
}
