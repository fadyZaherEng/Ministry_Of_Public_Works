import 'dart:async';

import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/project/request/projects_request.dart';
import 'package:aim/src/domain/entities/filter/end_user.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/domain/usecases/get_end_users_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_projects_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'projects_event.dart';
part 'projects_state.dart';

class ProjectsBloc extends Bloc<ProjectsEvent, ProjectsState> {
  final GetProjectsUseCase _getProjectsUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetEndUsersUseCase _getEndUsersUseCase;
  Sort selectedSort = sorts.first;
  List<Phase> phases = [];
  List<EndUser> endUsers = [];
  Phase selectedPhase = const Phase();
  List<ProjectType> projectTypes = [];
  ProjectType selectedProjectType = const ProjectType();
  EndUser selectedEndUser = const EndUser();
  DateTime? selectedFromDatetime = DateTime(2020, 1, 1);
  DateTime? selectedToDatetime;
  List<Project> projects = List.empty(growable: true);

  ProjectsBloc(
    this._getProjectsUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getEndUsersUseCase,
  ) : super(ProjectsInitial()) {
    on<GetProjectsEvent>(_onGetProjectsEvent);
    on<NavigateToProjectDetailsScreenEvent>(
        _onNavigateToProjectDetailsScreenEvent);
    on<SearchProjectsEvent>(_onSearchProjectsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetEndUsersEvent>(_onGetEndUsersEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectEndUserEvent>(_onSelectEndUserEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetProjectsEvent(
      GetProjectsEvent event, Emitter<ProjectsState> emit) async {
    ProjectsRequest projectsRequest;
    String language = await _getLanguageUseCase();
    projectsRequest =
        event.request.copyWith(isEnglishLanguage: _isLanguageEnglish(language));
    if (projectsRequest.pageNo == 1) {
      emit(ShowSkeletonState());
      projects.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getProjectsUseCase(projectsRequest);
    if (dataState is DataSuccess) {
      projects.addAll(dataState.data?.projects ?? []);
      emit(GetProjectsSuccessState(projects: projects));
    } else {
      emit(GetProjectsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onNavigateToProjectDetailsScreenEvent(
      NavigateToProjectDetailsScreenEvent event, Emitter<ProjectsState> emit) {
    emit(NavigateToProjectDetailsScreenState(
      project: event.project,
    ));
  }

  bool _isLanguageEnglish(String languageCode) {
    return languageCode == "en" ? true : false;
  }

  FutureOr<void> _onSearchProjectsEvent(
      SearchProjectsEvent event, Emitter<ProjectsState> emit) {
    emit(SearchProjectsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<ProjectsState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<ProjectsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (phases.isEmpty) {
      final dataState = await _getPhasesUseCase(
          FilterRequest(isEnglishLanguage: _isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        phases = dataState.data ?? [];
        emit(GetPhasesSuccessState(phases: phases));
      } else {
        emit(GetPhasesFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetPhasesSuccessState(phases: phases));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<ProjectsState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<ProjectsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (projectTypes.isEmpty) {
      final datastate = await _getProjectTypesUseCase(
          FilterRequest(isEnglishLanguage: _isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        projectTypes = datastate.data ?? [];
        emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
      } else {
        emit(GetProjectTypesFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectProjectTypeEvent(
      SelectProjectTypeEvent event, Emitter<ProjectsState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<ProjectsState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<ProjectsState> emit) {
    selectedFromDatetime = event.fromDateTime;
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<ProjectsState> emit) {
    selectedToDatetime = event.toDateTime;
  }

  FutureOr<void> _onGetEndUsersEvent(
      GetEndUsersEvent event, Emitter<ProjectsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (endUsers.isEmpty) {
      final dataState = await _getEndUsersUseCase(
          FilterRequest(isEnglishLanguage: _isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        endUsers = dataState.data ?? [];
        emit(GetEndUsersSuccessState(endUsers: endUsers));
      } else {
        emit(GetEndUsersFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetEndUsersSuccessState(endUsers: endUsers));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectEndUserEvent(
      SelectEndUserEvent event, Emitter<ProjectsState> emit) {
    selectedEndUser = event.endUser;
    emit(SelectEndUserState(endUser: selectedEndUser));
  }
}
