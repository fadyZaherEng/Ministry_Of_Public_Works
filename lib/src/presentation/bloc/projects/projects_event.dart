part of 'projects_bloc.dart';

abstract class ProjectsEvent extends Equatable {
  const ProjectsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetProjectsEvent extends ProjectsEvent {
  final ProjectsRequest request;

  const GetProjectsEvent({
    required this.request,
  });
}

class SearchProjectsEvent extends ProjectsEvent {
  final String keyword;

  const SearchProjectsEvent({
    required this.keyword,
  });
}

class SelectSortEvent extends ProjectsEvent {
  final Sort sort;

  const SelectSortEvent({
    required this.sort,
  });
}

class GetPhasesEvent extends ProjectsEvent {
  const GetPhasesEvent();
}

class GetProjectTypesEvent extends ProjectsEvent {
  const GetProjectTypesEvent();
}

class GetEndUsersEvent extends ProjectsEvent {
  const GetEndUsersEvent();
}

class SelectPhaseEvent extends ProjectsEvent {
  final Phase phase;

  const SelectPhaseEvent({
    required this.phase,
  });
}

class SelectEndUserEvent extends ProjectsEvent {
  final EndUser endUser;

  const SelectEndUserEvent({
    required this.endUser,
  });
}

class SelectProjectTypeEvent extends ProjectsEvent {
  final ProjectType projectType;

  const SelectProjectTypeEvent({
    required this.projectType,
  });
}

class SelectFromDateEvent extends ProjectsEvent {
  final DateTime? fromDateTime;

  const SelectFromDateEvent({required this.fromDateTime});
}

class SelectToDateEvent extends ProjectsEvent {
  final DateTime? toDateTime;

  const SelectToDateEvent({required this.toDateTime});
}

class NavigateBackEvent extends ProjectsEvent {
  const NavigateBackEvent();
}

class NavigateToProjectDetailsScreenEvent extends ProjectsEvent {
  final Project project;

  const NavigateToProjectDetailsScreenEvent({
    required this.project,
  });
}
