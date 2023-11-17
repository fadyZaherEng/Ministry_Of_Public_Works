part of 'payments_bloc.dart';

abstract class PaymentsEvent extends Equatable {
  const PaymentsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPaymentsEvent extends PaymentsEvent {
  final PaymentsRequest request;

  const GetPaymentsEvent({
    required this.request,
  });
}

class GetPhasesEvent extends PaymentsEvent {
  const GetPhasesEvent();
}

class GetProjectTypesEvent extends PaymentsEvent {
  const GetProjectTypesEvent();
}


class GetStatusEvent extends PaymentsEvent {
  const GetStatusEvent();
}

class SearchPaymentsEvent extends PaymentsEvent {
  final String keyword;

  const SearchPaymentsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends PaymentsEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends PaymentsEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectProjectTypeEvent extends PaymentsEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class SelectStatusEvent extends PaymentsEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });
}

class SelectFromDateEvent extends PaymentsEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends PaymentsEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetPaymentByIdEvent extends PaymentsEvent {
  final String paymentId;

  const GetPaymentByIdEvent({
    required this.paymentId,
  });
}

class NavigateBackEvent extends PaymentsEvent {
  const NavigateBackEvent();
}
