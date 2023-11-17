import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_cards_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_in_progress_use_case.dart';
import 'package:aim/src/domain/usecases/get_permission_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'overview_dashboard_event.dart';

part 'overview_dashboard_state.dart';

class OverviewDashboardBloc
    extends Bloc<OverviewDashboardEvent, OverviewDashboardState> {
  final GetOverviewListUseCase _getOverviewListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetOverviewProjectsByPhaseUseCase _getOverviewProjectsByPhaseUseCase;
  final GetOverviewProjectsBySectorUseCase _getOverviewProjectsBySectorUseCase;
  final GetOverviewProjectsInProgressUseCase
      _getOverviewProjectsInProgressUseCase;
  final GetOverviewCardsUseCase _getOverviewCardsUseCase;
  final GetLocalPermissionUserCase _getLocalPermissionUserCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Overview> overviews = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  OverviewDashboardBloc(
    this._getOverviewListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getOverviewProjectsByPhaseUseCase,
    this._getOverviewProjectsBySectorUseCase,
    this._getOverviewProjectsInProgressUseCase,
    this._getOverviewCardsUseCase,
    this._getLocalPermissionUserCase,
  ) : super(OverviewDashboardInitial()) {
    on<GetOverviewEvent>(_onGetOverviewEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchOverviewEvent>(_onSearchOverviewEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetOverviewProjectsByPhaseEvent>(_onGetOverviewProjectsByPhaseEvent);
    on<GetOverviewProjectsBySectorEvent>(_onGetOverviewProjectsBySectorEvent);
    on<GetProjectsInProgressEvent>(_onGetProjectsInProgressEvent);
    on<GetOverviewCardsEvent>(_onGetOverviewCardsEvent);
    on<GetUserPermissionEvent>(_onGetUserPermissionEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetOverviewEvent(
      GetOverviewEvent event, Emitter<OverviewDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      overviews.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getOverviewListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      overviews.addAll(dataState.data?.overviews ?? []);
      emit(GetOverviewSuccessState(overviews: overviews));
    } else {
      emit(GetOverviewFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<OverviewDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<OverviewDashboardState> emit) async {
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

  FutureOr<void> _onSearchOverviewEvent(
      SearchOverviewEvent event, Emitter<OverviewDashboardState> emit) {
    emit(SearchOverviewState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<OverviewDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<OverviewDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<OverviewDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<OverviewDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetOverviewProjectsByPhaseEvent(
      GetOverviewProjectsByPhaseEvent event,
      Emitter<OverviewDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getOverviewProjectsByPhaseUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetOverviewProjectsByPhaseSuccessState(
          overviewChartByPhase: dataState.data ?? OverviewChartByPhase(),
        ),
      );
    } else {
      emit(
        GetOverviewProjectsByPhaseFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetOverviewProjectsBySectorEvent(
      GetOverviewProjectsBySectorEvent event,
      Emitter<OverviewDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getOverviewProjectsBySectorUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetOverviewProjectsBySectorSuccessState(
          overviewChartBySector: dataState.data ?? OverviewChartBySector(),
        ),
      );
    } else {
      emit(
        GetOverviewProjectsBySectorFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectsInProgressEvent(GetProjectsInProgressEvent event,
      Emitter<OverviewDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getOverviewProjectsInProgressUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetProjectsInProgressSuccessState(
          projects: dataState.data ?? 0,
        ),
      );
    } else {
      emit(
        GetProjectsInProgressFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetOverviewCardsEvent(
      GetOverviewCardsEvent event, Emitter<OverviewDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getOverviewCardsUseCase(
      event.phaseId,
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetOverviewCardsSuccessState(
          cards: dataState.data ?? [],
        ),
      );
    } else {
      emit(
        GetOverviewCardsFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetUserPermissionEvent(GetUserPermissionEvent event,
      Emitter<OverviewDashboardState> emit) async {
    String permission = await _getLocalPermissionUserCase();
    emit(GetUserPermissionState(permission: permission));
  }
}
