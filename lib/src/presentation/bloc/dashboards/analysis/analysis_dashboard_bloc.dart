import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/analysis/request/analysis_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/analysis/analysis.dart';
import 'package:aim/src/domain/entities/analysis/extension_item.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/domain/usecases/get_analysis_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_extension_period_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_years_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'analysis_dashboard_event.dart';

part 'analysis_dashboard_state.dart';

class AnalysisDashboardBloc
    extends Bloc<AnalysisDashboardEvent, AnalysisDashboardState> {
  final GetAnalysisListUseCase _getAnalysisListUseCase;
  final GetExtensionPeriodUseCase _getExtensionPeriodUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetYearsUseCase _getYearsUseCase;

  List<Analysis> analysis = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  List<ProjectType> sectors = [];
  List<Phase> phases = [];
  List<Year> years = [];
  Phase selectedPhase = Phase();
  Year selectedYear = Year();
  ProjectType selectedSector = const ProjectType();

  AnalysisDashboardBloc(
    this._getAnalysisListUseCase,
    this._getExtensionPeriodUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getYearsUseCase,
  ) : super(AnalysisInitial()) {
    on<GetAnalysisModuleListEvent>(_onGetAnalysisModuleListEvent);
    on<GetExtensionPeriodEvent>(_onGetExtensionPeriodEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetYearsEvent>(_onGetYearsEvent);
    on<SelectYearEvent>(_onSelectYearEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetAnalysisModuleListEvent(GetAnalysisModuleListEvent event,
      Emitter<AnalysisDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      analysis.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getAnalysisListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      analysis.addAll(dataState.data?.analysis ?? []);
      emit(GetAnalysisModuleListSuccessState(analysis: analysis));
    } else {
      emit(GetAnalysisModuleListFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetExtensionPeriodEvent(GetExtensionPeriodEvent event,
      Emitter<AnalysisDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (phases.isEmpty) {
      final dataState = await _getExtensionPeriodUseCase(
        event.id,
        event.year,
        isLanguageEnglish(language),
      );
      if (dataState is DataSuccess) {
        emit(GetExtensionPeriodSuccessState(
            extensionItems: dataState.data ?? []));
      } else {
        emit(GetExtensionPeriodFailState(
            errorMessage: dataState.message ?? "Try Again"));
      }
      emit(HideLoadingState());
    }
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<AnalysisDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (phases.isEmpty) {
      final dataState = await _getPhasesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
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

  FutureOr<void> _onGetSectorsEvent(
      GetSectorsEvent event, Emitter<AnalysisDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (sectors.isEmpty) {
      final dataState = await _getProjectTypesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        sectors = dataState.data ?? [];
        emit(GetSectorsSuccessState(sectors: sectors));
      } else {
        emit(GetSectorsFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetSectorsSuccessState(sectors: sectors));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<AnalysisDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<AnalysisDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onGetYearsEvent(
      GetYearsEvent event, Emitter<AnalysisDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (years.isEmpty) {
      final datastate = await _getYearsUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        years = datastate.data ?? [];
        emit(GetYearsSuccessState(years: years));
      } else {
        emit(GetYearsFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetYearsSuccessState(years: years));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectYearEvent(
      SelectYearEvent event, Emitter<AnalysisDashboardState> emit) {
    selectedYear = event.year;
    emit(SelectYearState(year: selectedYear));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<AnalysisDashboardState> emit) {
    emit(NavigateBackState());
  }
}
