part of 'project_details_bloc.dart';

abstract class ProjectDetailsState extends Equatable {
  const ProjectDetailsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class ProjectDetailsInitial extends ProjectDetailsState {}

class ShowLoadingState extends ProjectDetailsState {}

class HideLoadingState extends ProjectDetailsState {}

class ShowSkeletonState extends ProjectDetailsState {}


class GetProjectDetailsSuccessState extends ProjectDetailsState {
  final ProjectDetails projectDetails;

  const GetProjectDetailsSuccessState({
    required this.projectDetails,
  });
}

class GetProjectDetailsFailState extends ProjectDetailsState {
  final String errorMessage;

  const GetProjectDetailsFailState({
    required this.errorMessage,
  });
}

class DownloadGalleryState extends ProjectDetailsState {
  final List<Attachment> images;

  const DownloadGalleryState({
    required this.images,
  });
}

class DownloadDocumentsState extends ProjectDetailsState {
  final List<Attachment> documents;

  const DownloadDocumentsState({
    required this.documents,
  });
}

class DownloadGallerySuccessState extends ProjectDetailsState {
  const DownloadGallerySuccessState();
}

class DownloadDocumentsSuccessState extends ProjectDetailsState {
  const DownloadDocumentsSuccessState();
}

class DownloadFailState extends ProjectDetailsState {
  const DownloadFailState();
}


class GetPhasesSuccessState extends ProjectDetailsState {
  final List<ProjectDetails> projectsDetails;

  const GetPhasesSuccessState({
    required this.projectsDetails,
  });
}

class GetPhasesFailState extends ProjectDetailsState {
  final String errorMessage;

  const GetPhasesFailState({
    required this.errorMessage,
  });
}

class GetPhaseSuccessState extends ProjectDetailsState {
  final ProjectDetails projectDetails;

  const GetPhaseSuccessState({
    required this.projectDetails,
  });
}

class GetPhaseFailState extends ProjectDetailsState {
  final String errorMessage;

  const GetPhaseFailState({
    required this.errorMessage,
  });
}

class GetProjectDetailsPhasesSuccessState extends ProjectDetailsState {
  final List<DetailsPhase> phases;

  const GetProjectDetailsPhasesSuccessState({
    required this.phases,
  });
}

class GetProjectDetailsPhasesFailState extends ProjectDetailsState {
  final String errorMessage;

  const GetProjectDetailsPhasesFailState({
    required this.errorMessage,
  });
}
class NavigateBackState extends ProjectDetailsState {
  const NavigateBackState();
}
