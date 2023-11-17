part of 'risks_bloc.dart';

abstract class RisksState extends Equatable {
  const RisksState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class RisksInitial extends RisksState {}

class ShowSkeletonState extends RisksState {}

class ShowLoadingState extends RisksState {}

class HideLoadingState extends RisksState {}

class GetRisksSuccessState extends RisksState {
  final List<Risk> risks;
  final String language;

  const GetRisksSuccessState({
    required this.risks,
    required this.language,
  });
}

class GetRisksFailState extends RisksState {
  final String errorMessage;

  const GetRisksFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends RisksState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends RisksState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends RisksState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends RisksState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class GetStatusSuccessState extends RisksState {
  final List<Status> status;

  const GetStatusSuccessState({
    required this.status,
  });
}

class GetStatusFailState extends RisksState {
  final String errorMessage;

  const GetStatusFailState({
    required this.errorMessage,
  });
}

class SearchRisksState extends RisksState {
  final String keyword;

  const SearchRisksState({
    required this.keyword,
  });
}

class SelectSortState extends RisksState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends RisksState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectProjectTypeState extends RisksState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class SelectStatusState extends RisksState {
  final Status status;

  const SelectStatusState({
    required this.status,
  });
}

class SelectFromDateState extends RisksState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends RisksState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetRiskByIdSuccessState extends RisksState {
  final Risk risk;

  const GetRiskByIdSuccessState({
    required this.risk,
  });
}

class GetRiskByIdFailState extends RisksState {
  final String errorMessage;

  const GetRiskByIdFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends RisksState {
  const NavigateBackState();
}
