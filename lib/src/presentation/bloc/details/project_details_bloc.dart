import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/project/attachment.dart';
import 'package:aim/src/domain/entities/project/details_phase.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_details_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_details_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_phase_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_phases_use_case.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'project_details_event.dart';

part 'project_details_state.dart';

class ProjectDetailsBloc
    extends Bloc<ProjectDetailsEvent, ProjectDetailsState> {
  final GetProjectDetailsUseCase _getProjectDetailsUseCase;
  final GetProjectPhasesUseCase _getProjectPhasesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetProjectPhaseByIdUseCase _getProjectPhaseByIdUseCase;
  final GetProjectDetailsPhasesUseCase _getProjectDetailsPhasesUseCase;

  ProjectDetailsBloc(
    this._getProjectDetailsUseCase,
    this._getProjectPhasesUseCase,
    this._getLanguageUseCase,
    this._getProjectPhaseByIdUseCase,
    this._getProjectDetailsPhasesUseCase,
  ) : super(ProjectDetailsInitial()) {
    on<GetProjectDetailsEvent>(_onGetProjectDetailsEvent);
    on<DownloadGalleryEvent>(_onDownloadGalleryEvent);
    on<DownloadDocumentsEvent>(_onDownloadDocumentsEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetPhaseEvent>(_onGetPhaseEvent);
    on<GetProjectDetailsPhases>(_onGetProjectDetailsPhases);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetProjectDetailsEvent(
      GetProjectDetailsEvent event, Emitter<ProjectDetailsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowSkeletonState());
    final dataState = await _getProjectDetailsUseCase(
        event.projectId, _isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetProjectDetailsSuccessState(
          projectDetails: dataState.data ?? ProjectDetails()));
    } else {
      emit(GetProjectDetailsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<ProjectDetailsState> emit) {
    emit(const NavigateBackState());
  }

  bool _isLanguageEnglish(String languageCode) {
    return languageCode == "en" ? true : false;
  }

  FutureOr<void> _onDownloadGalleryEvent(
      DownloadGalleryEvent event, Emitter<ProjectDetailsState> emit) {
    emit(DownloadGalleryState(images: event.images));
  }

  FutureOr<void> _onDownloadDocumentsEvent(
      DownloadDocumentsEvent event, Emitter<ProjectDetailsState> emit) {
    emit(DownloadDocumentsState(documents: event.documents));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<ProjectDetailsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState =
        await _getProjectPhasesUseCase(event.id, _isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetPhasesSuccessState(projectsDetails: dataState.data ?? []));
    } else {
      emit(GetPhasesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhaseEvent(
      GetPhaseEvent event, Emitter<ProjectDetailsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState = await _getProjectPhaseByIdUseCase(
        event.id, isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetPhaseSuccessState(
          projectDetails: dataState.data ?? ProjectDetails()));
    } else {
      emit(GetPhaseFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectDetailsPhases(
      GetProjectDetailsPhases event, Emitter<ProjectDetailsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState = await _getProjectDetailsPhasesUseCase(
        event.id, _isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetProjectDetailsPhasesSuccessState(phases: dataState.data ?? []));
    } else {
      emit(GetProjectDetailsPhasesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }
}
