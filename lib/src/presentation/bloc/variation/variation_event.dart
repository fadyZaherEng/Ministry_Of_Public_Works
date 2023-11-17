part of 'variation_bloc.dart';

abstract class VariationEvent extends Equatable {
  const VariationEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetVariationsEvent extends VariationEvent {
  final VariationsRequest request;

  const GetVariationsEvent({
    required this.request,
  });
}

class GetStatusEvent extends VariationEvent {
  const GetStatusEvent();
}

class SearchVariationsEvent extends VariationEvent {
  final String keyword;

  const SearchVariationsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends VariationEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class SelectStatusEvent extends VariationEvent {
  final Status status;

  const SelectStatusEvent({
    required this.status,
  });
}

class SelectFromDateEvent extends VariationEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends VariationEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class GetVariationByIdEvent extends VariationEvent {
  final String variationId;

  const GetVariationByIdEvent({
    required this.variationId,
  });
}

class GetPhasesEvent extends VariationEvent {
  const GetPhasesEvent();
}

class GetProjectTypesEvent extends VariationEvent {
  const GetProjectTypesEvent();
}


class SelectPhaseEvent extends VariationEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectProjectTypeEvent extends VariationEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class NavigateBackEvent extends VariationEvent {
  const NavigateBackEvent();
}

