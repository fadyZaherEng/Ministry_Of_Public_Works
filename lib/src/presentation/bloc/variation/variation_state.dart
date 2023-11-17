part of 'variation_bloc.dart';

abstract class VariationState extends Equatable {
  const VariationState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class VariationInitial extends VariationState {}

class ShowSkeletonState extends VariationState {}

class ShowLoadingState extends VariationState {}

class HideLoadingState extends VariationState {}

class GetVariationsSuccessState extends VariationState {
  final List<Variation> variations;

  const GetVariationsSuccessState({
    required this.variations,
  });
}

class GetVariationsFailState extends VariationState {
  final String errorMessage;

  const GetVariationsFailState({
    required this.errorMessage,
  });
}

class GetStatusSuccessState extends VariationState {
  final List<Status> status;

  const GetStatusSuccessState({
    required this.status,
  });
}

class GetStatusFailState extends VariationState {
  final String errorMessage;

  const GetStatusFailState({
    required this.errorMessage,
  });
}

class SearchVariationsState extends VariationState {
  final String keyword;

  const SearchVariationsState({
    required this.keyword,
  });
}

class SelectSortState extends VariationState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectStatusState extends VariationState {
  final Status status;

  const SelectStatusState({
    required this.status,
  });
}

class SelectFromDateState extends VariationState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends VariationState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetVariationByIdSuccessState extends VariationState {
  final Variation variation;

  const GetVariationByIdSuccessState({
    required this.variation,
  });
}

class GetVariationByIdFailState extends VariationState {
  final String errorMessage;

  const GetVariationByIdFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends VariationState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends VariationState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends VariationState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends VariationState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}


class SelectPhaseState extends VariationState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectProjectTypeState extends VariationState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class NavigateBackState extends VariationState {
  const NavigateBackState();
}
