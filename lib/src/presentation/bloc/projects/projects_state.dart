part of 'projects_bloc.dart';

abstract class ProjectsState extends Equatable {
  const ProjectsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ProjectsInitial extends ProjectsState {}

class ShowSkeletonState extends ProjectsState {}

class ShowLoadingState extends ProjectsState {}

class HideLoadingState extends ProjectsState {}

class GetProjectsSuccessState extends ProjectsState {
  final List<Project> projects;

  const GetProjectsSuccessState({
    required this.projects,
  });
}

class GetProjectsFailState extends ProjectsState {
  final String errorMessage;

  const GetProjectsFailState({
    required this.errorMessage,
  });
}

class SearchProjectsState extends ProjectsState {
  final String keyword;

  const SearchProjectsState({
    required this.keyword,
  });
}

class SelectSortState extends ProjectsState {
  final Sort sort;

  const SelectSortState({
    required this.sort,
  });
}

class GetPhasesSuccessState extends ProjectsState {
  final List<Phase> phases;

  const GetPhasesSuccessState({
    required this.phases,
  });
}

class GetPhasesFailState extends ProjectsState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetEndUsersSuccessState extends ProjectsState {
  final List<EndUser> endUsers;

  const GetEndUsersSuccessState({
    required this.endUsers,
  });
}

class GetEndUsersFailState extends ProjectsState {
  final String errorMessage;

  const GetEndUsersFailState({
    required this.errorMessage,
  });
}


class SelectPhaseState extends ProjectsState {
  final Phase phase;

  const SelectPhaseState({
    required this.phase,
  });
}

class SelectEndUserState extends ProjectsState {
  final EndUser endUser;

  const SelectEndUserState({
    required this.endUser,
  });
}

class GetProjectTypesSuccessState extends ProjectsState {
  final List<ProjectType> projectTypes;

  const GetProjectTypesSuccessState({
    required this.projectTypes,
  });
}

class GetProjectTypesFailState extends ProjectsState {
  final String errorMessage;

  const GetProjectTypesFailState({
    required this.errorMessage,
  });
}

class SelectProjectTypeState extends ProjectsState {
  final ProjectType projectType;

  const SelectProjectTypeState({
    required this.projectType,
  });
}

class NavigateBackState extends ProjectsState {
  const NavigateBackState();
}

class NavigateToProjectDetailsScreenState extends ProjectsState {
  final Project project;

  const NavigateToProjectDetailsScreenState({
    required this.project,
  });
}
