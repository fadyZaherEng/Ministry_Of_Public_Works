part of 'payments_bloc.dart';

abstract class PaymentsState extends Equatable {
  const PaymentsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PaymentsInitial extends PaymentsState {}

class ShowSkeletonState extends PaymentsState {}

class ShowLoadingState extends PaymentsState {}

class HideLoadingState extends PaymentsState {}

class GetPaymentsSuccessState extends PaymentsState {
  final List<Payment> payments;

  const GetPaymentsSuccessState({
    required this.payments,
  });
}

class GetPaymentsFailState extends PaymentsState {
  final String errorMessage;

  const GetPaymentsFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends PaymentsState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends PaymentsState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends PaymentsState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends PaymentsState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class GetStatusSuccessState extends PaymentsState {
  final List<Status> status;

  const GetStatusSuccessState({
    required this.status,
  });
}

class GetStatusFailState extends PaymentsState {
  final String errorMessage;

  const GetStatusFailState({
    required this.errorMessage,
  });
}

class SearchPaymentsState extends PaymentsState {
  final String keyword;

  const SearchPaymentsState({
    required this.keyword,
  });
}

class SelectSortState extends PaymentsState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends PaymentsState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectProjectTypeState extends PaymentsState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class SelectStatusState extends PaymentsState {
  final Status status;

  const SelectStatusState({
    required this.status,
  });
}

class SelectFromDateState extends PaymentsState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends PaymentsState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetPaymentByIdSuccessState extends PaymentsState {
  final Payment payment;

  const GetPaymentByIdSuccessState({
    required this.payment,
  });
}

class GetPaymentByIdFailState extends PaymentsState {
  final String errorMessage;

  const GetPaymentByIdFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends PaymentsState {
  const NavigateBackState();
}
