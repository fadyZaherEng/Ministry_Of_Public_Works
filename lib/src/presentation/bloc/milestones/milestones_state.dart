part of 'milestones_bloc.dart';

abstract class MilestonesState extends Equatable {
  const MilestonesState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class MilestonesInitial extends MilestonesState {}

class ShowSkeletonState extends MilestonesState {}

class ShowLoadingState extends MilestonesState {}

class HideLoadingState extends MilestonesState {}

class GetMilestonesSuccessState extends MilestonesState {
  final List<Milestone> milestones;

  const GetMilestonesSuccessState({
    required this.milestones,
  });
}

class GetMilestonesFailState extends MilestonesState {
  final String errorMessage;

  const GetMilestonesFailState({
    required this.errorMessage,
  });
}

class GetPhasesSuccessState extends MilestonesState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends MilestonesState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetProjectTypesSuccessState extends MilestonesState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends MilestonesState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class GetStatusSuccessState extends MilestonesState {
  final List<Status> status;

  const GetStatusSuccessState({
    required this.status,
  });
}

class GetStatusFailState extends MilestonesState {
  final String errorMessage;

  const GetStatusFailState({
    required this.errorMessage,
  });
}

class SearchMilestonesState extends MilestonesState {
  final String keyword;

  const SearchMilestonesState({
    required this.keyword,
  });
}

class SelectSortState extends MilestonesState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class SelectPhaseState extends MilestonesState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectProjectTypeState extends MilestonesState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class SelectStatusState extends MilestonesState {
  final Status status;

  const SelectStatusState({
    required this.status,
  });
}

class SelectFromDateState extends MilestonesState {
  final DateTime? fromDate;

  const SelectFromDateState({
    required this.fromDate,
  });
}

class SelectToDateState extends MilestonesState {
  final DateTime? toDate;

  const SelectToDateState({
    required this.toDate,
  });
}

class GetMilestoneByIdSuccessState extends MilestonesState {
  final Milestone milestone;

  const GetMilestoneByIdSuccessState({
    required this.milestone,
  });
}

class GetMilestoneByIdFailState extends MilestonesState {
  final String errorMessage;

  const GetMilestoneByIdFailState({
    required this.errorMessage,
  });
}

class NavigateBackState extends MilestonesState {
  const NavigateBackState();
}
