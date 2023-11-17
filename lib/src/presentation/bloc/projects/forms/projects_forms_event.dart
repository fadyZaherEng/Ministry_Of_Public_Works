part of 'projects_forms_bloc.dart';

abstract class ProjectsFormsEvent extends Equatable {
  const ProjectsFormsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetPhasesEvent extends ProjectsFormsEvent {
  final String id;
  const GetPhasesEvent({
    required this.id,
  });
}