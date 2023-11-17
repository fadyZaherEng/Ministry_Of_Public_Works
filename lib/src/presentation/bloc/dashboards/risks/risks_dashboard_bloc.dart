import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_abalysis_chart_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_abalysis_chart_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_risks_list_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'risks_dashboard_event.dart';

part 'risks_dashboard_state.dart';

class RisksDashboardBloc
    extends Bloc<RisksDashboardEvent, RisksDashboardState> {
  final GetRisksListUseCase _getRisksListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetRiskAnalysisChartBySectorUseCase
      _getRiskAnalysisChartBySectorUseCase;
  final GetRiskAnalysisChartByPhaseUseCase _getRiskAnalysisChartByPhaseUseCase;
  final GetRiskCountsUseCase _getRiskCountsUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Risk> risks = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  RisksDashboardBloc(
    this._getRisksListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getRiskAnalysisChartBySectorUseCase,
    this._getRiskAnalysisChartByPhaseUseCase,
    this._getRiskCountsUseCase,
  ) : super(RisksDashboardInitial()) {
    on<GetRisksEvent>(_onGetRisksEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchRisksEvent>(_onSearchRisksEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetRiskAnalysisChartBySectorEvent>(_onGetRiskAnalysisChartBySectorEvent);
    on<GetRiskAnalysisChartByPhaseEvent>(_onGetRiskAnalysisChartByPhaseEvent);
    on<GetRiskCountsEvent>(_onGetRiskCountsEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetRisksEvent(
      GetRisksEvent event, Emitter<RisksDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      risks.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getRisksListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      risks.addAll(dataState.data?.risks ?? []);
      emit(GetRisksSuccessState(risks: risks));
    } else {
      emit(GetRisksFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<RisksDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<RisksDashboardState> emit) async {
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

  FutureOr<void> _onSearchRisksEvent(
      SearchRisksEvent event, Emitter<RisksDashboardState> emit) {
    emit(SearchRisksState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<RisksDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<RisksDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<RisksDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<RisksDashboardState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetRiskAnalysisChartBySectorEvent(
      GetRiskAnalysisChartBySectorEvent event,
      Emitter<RisksDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getRiskAnalysisChartBySectorUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetRiskAnalysisChartBySectorSuccessState(
          analysisChartBySector:
              dataState.data ?? const AnalysisChartBySector(),
        ),
      );
    } else {
      emit(
        GetRiskAnalysisChartBySectorFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetRiskAnalysisChartByPhaseEvent(
      GetRiskAnalysisChartByPhaseEvent event,
      Emitter<RisksDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getRiskAnalysisChartByPhaseUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetRiskAnalysisChartByPhaseSuccessState(
          analysisChartByPhase: dataState.data ?? const AnalysisChartByPhase(),
        ),
      );
    } else {
      emit(
        GetRiskAnalysisChartByPhaseFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetRiskCountsEvent(
      GetRiskCountsEvent event, Emitter<RisksDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getRiskCountsUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetRiskCountsSuccessState(
          counts: dataState.data ?? [],
        ),
      );
    } else {
      emit(
        GetRiskCountsFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }
}
