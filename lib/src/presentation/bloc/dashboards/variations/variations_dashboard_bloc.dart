import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/dashboards/variations_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_circle_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'variations_dashboard_event.dart';

part 'variations_dashboard_state.dart';

class VariationsDashboardBloc
    extends Bloc<VariationsDashboardEvent, VariationsDashboardState> {
  final GetVariationsListUseCase _getVariationsListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetVariationsChartUseCase _getVariationsChartUseCase;
  final GetVariationsCircleChartUseCase _getVariationsCircleChartUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Variation> variations = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  VariationsDashboardBloc(
    this._getVariationsListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getVariationsChartUseCase,
    this._getVariationsCircleChartUseCase,
  ) : super(VariationsDashboardInitial()) {
    on<GetVariationsEvent>(_onGetVariationsEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchVariationsEvent>(_onSearchVariationsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetVariationsChartEvent>(_onGetVariationsChartEvent);
    on<GetVariationsCircleChartEvent>(_onGetVariationsCircleChartEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetVariationsEvent(
      GetVariationsEvent event, Emitter<VariationsDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      variations.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getVariationsListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      variations.addAll(dataState.data?.variations ?? []);
      emit(GetVariationsSuccessState(variations: variations));
    } else {
      emit(GetVariationsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<VariationsDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<VariationsDashboardState> emit) async {
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

  FutureOr<void> _onSearchVariationsEvent(
      SearchVariationsEvent event, Emitter<VariationsDashboardState> emit) {
    emit(SearchVariationsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<VariationsDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<VariationsDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<VariationsDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<VariationsDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetVariationsChartEvent(GetVariationsChartEvent event,
      Emitter<VariationsDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getVariationsChartUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetVariationsChartSuccessState(
          variationsChart: dataState.data ?? VariationsChart(),
        ),
      );
    } else {
      emit(
        GetVariationsChartFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetVariationsCircleChartEvent(
      GetVariationsCircleChartEvent event,
      Emitter<VariationsDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getVariationsCircleChartUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetVariationsCircleChartSuccessState(
          circleChart: dataState.data ?? CircleChart(),
        ),
      );
    } else {
      emit(
        GetVariationsCircleChartFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }
}
