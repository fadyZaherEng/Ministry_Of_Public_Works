import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_phase.dart';
import 'package:aim/src/domain/entities/dashboards/analysis_chart_by_sector.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/usecases/get_issue_abalysis_chart_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_abalysis_chart_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_issue_counts_use_case.dart';
import 'package:aim/src/domain/usecases/get_issues_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'issues_dashboard_event.dart';

part 'issues_dashboard_state.dart';

class IssuesDashboardBloc
    extends Bloc<IssuesDashboardEvent, IssuesDashboardState> {
  final GetIssuesListUseCase _getIssuesListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetIssueAnalysisChartBySectorUseCase
      _getIssueAnalysisChartBySectorUseCase;
  final GetIssueAnalysisChartByPhaseUseCase _getIssueAnalysisChartByPhaseUseCase;
  final GetIssueCountsUseCase _getIssueCountsUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Issue> issues = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  IssuesDashboardBloc(
    this._getIssuesListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getIssueAnalysisChartBySectorUseCase,
    this._getIssueAnalysisChartByPhaseUseCase,
    this._getIssueCountsUseCase,
  ) : super(IssuesDashboardInitial()) {
    on<GetIssuesEvent>(_onGetIssuesEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchIssuesEvent>(_onSearchIssuesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetIssueAnalysisChartBySectorEvent>(_onGetIssueAnalysisChartBySectorEvent);
    on<GetIssueAnalysisChartByPhaseEvent>(_onGetIssueAnalysisChartByPhaseEvent);
    on<GetIssueCountsEvent>(_onGetIssueCountsEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetIssuesEvent(
      GetIssuesEvent event, Emitter<IssuesDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      issues.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getIssuesListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      issues.addAll(dataState.data?.issues ?? []);
      emit(GetIssuesSuccessState(issues: issues));
    } else {
      emit(GetIssuesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<IssuesDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<IssuesDashboardState> emit) async {
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

  FutureOr<void> _onSearchIssuesEvent(
      SearchIssuesEvent event, Emitter<IssuesDashboardState> emit) {
    emit(SearchIssuesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<IssuesDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<IssuesDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<IssuesDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<IssuesDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetIssueAnalysisChartBySectorEvent(
      GetIssueAnalysisChartBySectorEvent event,
      Emitter<IssuesDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getIssueAnalysisChartBySectorUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetIssueAnalysisChartBySectorSuccessState(
          analysisChartBySector: dataState.data ?? AnalysisChartBySector(),
        ),
      );
    } else {
      emit(
        GetIssueAnalysisChartBySectorFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetIssueAnalysisChartByPhaseEvent(
      GetIssueAnalysisChartByPhaseEvent event,
      Emitter<IssuesDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getIssueAnalysisChartByPhaseUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetIssueAnalysisChartByPhaseSuccessState(
          analysisChartByPhase: dataState.data ?? AnalysisChartByPhase(),
        ),
      );
    } else {
      emit(
        GetIssueAnalysisChartByPhaseFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetIssueCountsEvent(
      GetIssueCountsEvent event, Emitter<IssuesDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getIssueCountsUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetIssueCountsSuccessState(
          counts: dataState.data ?? [],
        ),
      );
    } else {
      emit(
        GetIssueCountsFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }
}
