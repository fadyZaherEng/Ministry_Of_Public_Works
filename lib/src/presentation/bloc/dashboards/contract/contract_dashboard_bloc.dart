import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/contract/request/contract_list_request.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/overview/request/overview_list_request.dart';
import 'package:aim/src/domain/entities/contract/approved_analysis.dart';
import 'package:aim/src/domain/entities/contract/contract.dart';
import 'package:aim/src/domain/entities/contract/delay_analysis.dart';
import 'package:aim/src/domain/entities/contract/operation_analysis.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/overview/overview.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_phase.dart';
import 'package:aim/src/domain/entities/overview/overview_chart_by_sector.dart';
import 'package:aim/src/domain/usecases/get_approved_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_contract_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_delay_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_operation_analysis_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_cards_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_phase_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_by_sector_use_case.dart';
import 'package:aim/src/domain/usecases/get_overview_projects_in_progress_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'contract_dashboard_event.dart';

part 'contract_dashboard_state.dart';

class ContractDashboardBloc
    extends Bloc<ContractDashboardEvent, ContractDashboardState> {
  final GetContractListUseCase _getContractListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetApprovedAnalysisUseCase _getApprovedAnalysisUseCase;
  final GetDelayAnalysisUseCase _getDelayAnalysisUseCase;
  final GetOperationAnalysisUseCase _getOperationAnalysisUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Contract> contracts = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();

  ContractDashboardBloc(
    this._getContractListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getApprovedAnalysisUseCase,
    this._getDelayAnalysisUseCase,
    this._getOperationAnalysisUseCase,
  ) : super(ContractDashboardInitial()) {
    on<GetContractsEvent>(_onGetContractsEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchContractEvent>(_onSearchContractEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetApprovedAnalysisEvent>(_onGetApprovedAnalysisEvent);
    on<GetDelayAnalysisEvent>(_onGetDelayAnalysisEvent);
    on<GetOperationAnalysisEvent>(_onGetOperationAnalysisEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetContractsEvent(
      GetContractsEvent event, Emitter<ContractDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      contracts.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getContractListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      contracts.addAll(dataState.data?.contracts ?? []);
      emit(GetContractSuccessState(contracts: contracts));
    } else {
      emit(GetContractFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<ContractDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<ContractDashboardState> emit) async {
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

  FutureOr<void> _onSearchContractEvent(
      SearchContractEvent event, Emitter<ContractDashboardState> emit) {
    emit(SearchContractState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<ContractDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<ContractDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<ContractDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<ContractDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetApprovedAnalysisEvent(GetApprovedAnalysisEvent event,
      Emitter<ContractDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getApprovedAnalysisUseCase(
      event.sectorId,
    );
    if (dataState is DataSuccess) {
      emit(
        GetApprovedAnalysisSuccessState(
          approvedAnalysis: dataState.data ?? ApprovedAnalysis(),
        ),
      );
    } else {
      emit(
        GetApprovedAnalysisFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetDelayAnalysisEvent(
      GetDelayAnalysisEvent event, Emitter<ContractDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getDelayAnalysisUseCase();
    if (dataState is DataSuccess) {
      emit(
        GetDelayAnalysisSuccessState(
          delayAnalysis: dataState.data ?? DelayAnalysis(),
        ),
      );
    } else {
      emit(
        GetDelayAnalysisFailState(errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetOperationAnalysisEvent(GetOperationAnalysisEvent event,
      Emitter<ContractDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getOperationAnalysisUseCase();
    if (dataState is DataSuccess) {
      emit(
        GetOperationAnalysisSuccessState(
          operationAnalysis: dataState.data ?? OperationAnalysis(),
        ),
      );
    } else {
      emit(
        GetOperationAnalysisFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }
}
