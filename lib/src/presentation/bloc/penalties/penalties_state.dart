part of 'penalties_bloc.dart';

abstract class PenaltiesState extends Equatable {
  const PenaltiesState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class PenaltiesInitial extends PenaltiesState {}

class ShowSkeletonState extends PenaltiesState {}

class ShowLoadingState extends PenaltiesState {}

class HideLoadingState extends PenaltiesState {}

class GetPenaltiesSuccessState extends PenaltiesState {
  final List<Penalty> penalties;

  const GetPenaltiesSuccessState({
    required this.penalties,
  });
}

class GetPenaltiesFailState extends PenaltiesState {
  final String errorMessage;

  const GetPenaltiesFailState({
    required this.errorMessage,
  });
}

class GetPenaltyTypesSuccessState extends PenaltiesState {
  final List<PenaltyType> penaltyTypes;

  const GetPenaltyTypesSuccessState({
    required this.penaltyTypes,
  });
}

class GetPenaltyTypesFailState extends PenaltiesState {
  final String errorMessage;

  const GetPenaltyTypesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends PenaltiesState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends PenaltiesState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class SearchPenaltiesState extends PenaltiesState {
  final String keyword;

  const SearchPenaltiesState({
    required this.keyword,
  });
}

class SelectSortState extends PenaltiesState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends PenaltiesState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectPenaltyTypeState extends PenaltiesState {
  final PenaltyType penaltyType;

  const SelectPenaltyTypeState({
    required this.penaltyType,
  });
}

class GetProjectTypesSuccessState extends PenaltiesState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends PenaltiesState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class SelectProjectTypeState extends PenaltiesState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class SelectFromDateState extends PenaltiesState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends PenaltiesState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetPenaltyByIdSuccessState extends PenaltiesState {
  final Penalty penalty;

  const GetPenaltyByIdSuccessState({
    required this.penalty,
  });
}

class GetPenaltyByIdFailState extends PenaltiesState {
  final String errorMessage;

  const GetPenaltyByIdFailState({
    required this.errorMessage,
  });
}



class NavigateBackState extends PenaltiesState {
  const NavigateBackState();
}
