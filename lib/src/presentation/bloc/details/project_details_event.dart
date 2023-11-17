part of 'project_details_bloc.dart';

abstract class ProjectDetailsEvent extends Equatable {
  const ProjectDetailsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetProjectDetailsEvent extends ProjectDetailsEvent {
  final String projectId;

  const GetProjectDetailsEvent({
    required this.projectId,
  });
}

class DownloadGalleryEvent extends ProjectDetailsEvent {
  final List<Attachment> images;

  const DownloadGalleryEvent({
    required this.images,
  });
}

class DownloadDocumentsEvent extends ProjectDetailsEvent {
  final List<Attachment> documents;

  const DownloadDocumentsEvent({
    required this.documents,
  });
}

class GetPhasesEvent extends ProjectDetailsEvent {
  final String id;
  const GetPhasesEvent({
    required this.id,
  });
}

class GetPhaseEvent extends ProjectDetailsEvent {
  final String id;

  const GetPhaseEvent({
    required this.id,
  });
}


class GetProjectDetailsPhases extends ProjectDetailsEvent {
  final String id;
  const GetProjectDetailsPhases({
    required this.id,
  });
}

class NavigateBackEvent extends ProjectDetailsEvent {
  const NavigateBackEvent();
}
