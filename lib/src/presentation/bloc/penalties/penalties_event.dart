part of 'penalties_bloc.dart';

abstract class PenaltiesEvent extends Equatable {
  const PenaltiesEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

abstract class PaymentsEvent extends Equatable {
  const PaymentsEvent();
}

class GetPenaltiesEvent extends PenaltiesEvent {
  final PenaltiesRequest request;

  const GetPenaltiesEvent({
    required this.request,
  });
}

class GetPhasesEvent extends PenaltiesEvent {
  const GetPhasesEvent();
}

class SelectPhaseEvent extends PenaltiesEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class GetPenaltyTypesEvent extends PenaltiesEvent {
  const GetPenaltyTypesEvent();
}

class GetProjectTypesEvent extends PenaltiesEvent {
  const GetProjectTypesEvent();
}

class SelectProjectTypeEvent extends PenaltiesEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}
class SearchPenaltiesEvent extends PenaltiesEvent {
  final String keyword;

  const SearchPenaltiesEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends PenaltiesEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPenaltyTypeEvent extends PenaltiesEvent {
  final PenaltyType penaltyType;

  const SelectPenaltyTypeEvent({
    required this.penaltyType,
  });
}

class SelectFromDateEvent extends PenaltiesEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends PenaltiesEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetPenaltyByIdEvent extends PenaltiesEvent {
  final String penaltyId;

  const GetPenaltyByIdEvent({
    required this.penaltyId,
  });
}

class NavigateBackEvent extends PenaltiesEvent {
  const NavigateBackEvent();
}
