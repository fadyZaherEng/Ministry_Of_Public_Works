part of 'risks_bloc.dart';

abstract class RisksEvent extends Equatable {
  const RisksEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetRisksEvent extends RisksEvent {
  final RisksRequest request;

  const GetRisksEvent({
    required this.request,
  });
}

class GetPhasesEvent extends RisksEvent {
  const GetPhasesEvent();
}

class GetStatusEvent extends RisksEvent {
  const GetStatusEvent();
}

class GetProjectTypesEvent extends RisksEvent {
  const GetProjectTypesEvent();
}


class SearchRisksEvent extends RisksEvent {
  final String keyword;

  const SearchRisksEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends RisksEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectPhaseEvent extends RisksEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectProjectTypeEvent extends RisksEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class SelectStatusEvent extends RisksEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });
}

class SelectFromDateEvent extends RisksEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends RisksEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetRiskByIdEvent extends RisksEvent {
  final String riskId;

  const GetRiskByIdEvent({
    required this.riskId,
  });
}

class NavigateBackEvent extends RisksEvent {
  const NavigateBackEvent();
}
