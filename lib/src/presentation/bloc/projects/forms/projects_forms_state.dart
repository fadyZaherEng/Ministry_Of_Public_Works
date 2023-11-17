part of 'projects_forms_bloc.dart';

abstract class ProjectsFormsState extends Equatable {
  const ProjectsFormsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ProjectsFormsInitial extends ProjectsFormsState {}

class ShowLoadingState extends ProjectsFormsState {}

class HideLoadingState extends ProjectsFormsState {}

class GetPhasesSuccessState extends ProjectsFormsState {
  final List<ProjectDetails> projectsDetails;
  final String language;

  const GetPhasesSuccessState({
    required this.projectsDetails,
    required this.language,
  });
}

class GetPhasesFailState extends ProjectsFormsState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}
