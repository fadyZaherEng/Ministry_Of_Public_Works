import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/package/request/package_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/package/package.dart';
import 'package:aim/src/domain/entities/package/package_analysis_chart.dart';
import 'package:aim/src/domain/entities/package/package_circle_chart.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_analysis_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_package_ministry_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'package_dashboard_event.dart';

part 'package_dashboard_state.dart';

class PackageDashboardBloc
    extends Bloc<PackageDashboardEvent, PackageDashboardState> {
  final GetPackageListUseCase _getPackageListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPackageAnalysisChartUseCase _getPackageAnalysisChartUseCase;
  final GetPackageMinistryChartUseCase _getPackageMinistryChartUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Package> packages = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();
  Indicator selectedIndicator = const Indicator();

  PackageDashboardBloc(
    this._getPackageListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getPackageAnalysisChartUseCase,
    this._getPackageMinistryChartUseCase,
  ) : super(PackageDashboardInitial()) {
    on<GetPackagesEvent>(_onGetPackagesEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchPackagesEvent>(_onSearchPackagesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetPackageAnalysisChartEvent>(_onGetPackageAnalysisChartEvent);
    on<GetPackageMinistryChartEvent>(_onGetPackageMinistryChartEvent);
    on<SelectIndicatorEvent>(_onSelectIndicatorEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetPackagesEvent(
      GetPackagesEvent event, Emitter<PackageDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      packages.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getPackageListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      packages.addAll(dataState.data?.packages ?? []);
      emit(GetPackagesSuccessState(packages: packages));
    } else {
      emit(GetPackagesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<PackageDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<PackageDashboardState> emit) async {
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

  FutureOr<void> _onSearchPackagesEvent(
      SearchPackagesEvent event, Emitter<PackageDashboardState> emit) {
    emit(SearchPackagesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<PackageDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<PackageDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<PackageDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<PackageDashboardState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetPackageAnalysisChartEvent(
      GetPackageAnalysisChartEvent event,
      Emitter<PackageDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPackageAnalysisChartUseCase(
      event.sectorId,
      event.color,
    );
    if (dataState is DataSuccess) {
      emit(
        GetPackageAnalysisCharSuccessState(
          packageAnalysisChart: dataState.data ?? const PackageAnalysisChart(),
        ),
      );
    } else {
      emit(
        GetPackageAnalysisCharFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPackageMinistryChartEvent(
      GetPackageMinistryChartEvent event,
      Emitter<PackageDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPackageMinistryChartUseCase(
      event.sectorId,
      event.color,
    );
    if (dataState is DataSuccess) {
      emit(
        GetPackageMinistryChartSuccessState(
          packageCircleChart: dataState.data ?? const PackageCircleChart(),
        ),
      );
    } else {
      emit(
        GetPackageMinistryChartFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectIndicatorEvent(
      SelectIndicatorEvent event, Emitter<PackageDashboardState> emit) {
    selectedIndicator = event.indicator;
    emit(SelectIndicatorState(indicator: selectedIndicator));
  }
}
