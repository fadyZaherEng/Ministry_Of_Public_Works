import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/dashboards/penalties_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/project/project.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_chart_design_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_chart_execution_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'penalties_dashboard_event.dart';

part 'penalties_dashboard_state.dart';

class PenaltiesDashboardBloc
    extends Bloc<PenaltiesDashboardEvent, PenaltiesDashboardState> {
  final GetPenaltiesListUseCase _getPenaltiesListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPenaltiesChartDesignUseCase _getPenaltiesChartDesignUseCase;
  final GetPenaltiesChartExecutionUseCase _getPenaltiesChartExecutionUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Project> penalties = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();
  Indicator selectedIndicator = const Indicator();

  PenaltiesDashboardBloc(
    this._getPenaltiesListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getPenaltiesChartDesignUseCase,
    this._getPenaltiesChartExecutionUseCase,
  ) : super(PenaltiesDashboardInitial()) {
    on<GetPenaltiesEvent>(_onGetPenaltiesEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchPenaltiesEvent>(_onSearchPenaltiesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetPenaltyChartDesignEvent>(_onGetPenaltyChartDesignEvent);
    on<GetPenaltyChartExecutionEvent>(_onGetPenaltyChartExecutionEvent);
    on<SelectIndicatorEvent>(_onSelectIndicatorEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetPenaltiesEvent(
      GetPenaltiesEvent event, Emitter<PenaltiesDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      penalties.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getPenaltiesListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      penalties.addAll(dataState.data?.projects ?? []);
      emit(GetPenaltiesSuccessState(penalties: penalties));
    } else {
      emit(GetPenaltiesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<PenaltiesDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<PenaltiesDashboardState> emit) async {
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

  FutureOr<void> _onSearchPenaltiesEvent(
      SearchPenaltiesEvent event, Emitter<PenaltiesDashboardState> emit) {
    emit(SearchPenaltiesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<PenaltiesDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<PenaltiesDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<PenaltiesDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<PenaltiesDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetPenaltyChartDesignEvent(
      GetPenaltyChartDesignEvent event,
      Emitter<PenaltiesDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPenaltiesChartDesignUseCase(
      event.sectorId,
      event.color,
    );
    if (dataState is DataSuccess) {
      emit(
        GetPenaltyChartDesignSuccessState(
          penaltiesChart: dataState.data ?? PenaltiesChart(),
        ),
      );
    } else {
      emit(
        GetPenaltyChartDesignFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPenaltyChartExecutionEvent(
      GetPenaltyChartExecutionEvent event,
      Emitter<PenaltiesDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPenaltiesChartExecutionUseCase(
      event.sectorId,
      event.color,
    );
    if (dataState is DataSuccess) {
      emit(
        GetPenaltyChartExecutionSuccessState(
          penaltiesChart: dataState.data ?? PenaltiesChart(),
        ),
      );
    } else {
      emit(
        GetPenaltyChartExecutionFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectIndicatorEvent(SelectIndicatorEvent event, Emitter<PenaltiesDashboardState> emit) {
    selectedIndicator = event.indicator;
    emit(SelectIndicatorState(indicator: event.indicator));
  }
}
