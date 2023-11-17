import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/design/request/design_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/dashboards/circle_chart.dart';
import 'package:aim/src/domain/entities/design/design.dart';
import 'package:aim/src/domain/entities/design/design_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/usecases/get_design_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_design_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_design_ministry_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'design_dashboard_event.dart';

part 'design_dashboard_state.dart';

class DesignDashboardBloc
    extends Bloc<DesignDashboardEvent, DesignDashboardState> {
  final GetDesignListUseCase _getDesignListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetDesignChartUseCase _getDesignChartUseCase;
  final GetDesignMinistryUseCase _getDesignMinistryUseCase;

  List<Design> designs = List.empty(growable: true);
  List<ProjectType> sectors = [];
  List<Phase> phases = [];
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  DesignDashboardBloc(
    this._getDesignListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getDesignChartUseCase,
    this._getDesignMinistryUseCase,
  ) : super(DesignDashboardInitial()) {
    on<GetDesignsEvent>(_onGetDesignsEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchDesignEvent>(_onSearchDesignEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetDesignChartEvent>(_onGetDesignChartEvent);
    on<GetDesignMinistryEvent>(_onGetDesignMinistryEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetDesignsEvent(
      GetDesignsEvent event, Emitter<DesignDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      designs.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getDesignListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      designs.addAll(dataState.data?.designs ?? []);
      emit(GetDesignsSuccessState(designs: designs));
    } else {
      emit(GetDesignsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<DesignDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<DesignDashboardState> emit) async {
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

  FutureOr<void> _onSearchDesignEvent(
      SearchDesignEvent event, Emitter<DesignDashboardState> emit) {
    emit(SearchDesignState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<DesignDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<DesignDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<DesignDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<DesignDashboardState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetDesignChartEvent(
      GetDesignChartEvent event, Emitter<DesignDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getDesignChartUseCase(
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetDesignChartSuccessState(
          designChart: dataState.data ?? const DesignChart(),
        ),
      );
    } else {
      emit(
        GetDesignChartFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetDesignMinistryEvent(
      GetDesignMinistryEvent event, Emitter<DesignDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getDesignMinistryUseCase(
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetDesignMinistrySuccessState(
          circleChart: dataState.data ?? const CircleChart(),
        ),
      );
    } else {
      emit(
        GetDesignMinistryFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }
}
