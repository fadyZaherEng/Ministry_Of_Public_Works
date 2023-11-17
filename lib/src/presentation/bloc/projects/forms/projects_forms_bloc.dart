import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/project/project_details.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_phases_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'projects_forms_event.dart';

part 'projects_forms_state.dart';

class ProjectsFormsBloc extends Bloc<ProjectsFormsEvent, ProjectsFormsState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final GetProjectPhasesUseCase _getProjectPhasesUseCase;

  ProjectsFormsBloc(
    this._getLanguageUseCase,
    this._getProjectPhasesUseCase,
  ) : super(ProjectsFormsInitial()) {
    on<GetPhasesEvent>(_onGetPhaseEvent);
  }

  FutureOr<void> _onGetPhaseEvent(
      GetPhasesEvent event, Emitter<ProjectsFormsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState =
        await _getProjectPhasesUseCase(event.id, isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetPhasesSuccessState(
        projectsDetails: dataState.data ?? [],
        language: language,
      ));
    } else {
      emit(GetPhasesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }
}
