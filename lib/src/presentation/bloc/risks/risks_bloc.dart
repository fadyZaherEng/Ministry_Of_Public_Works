import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/risks/request/risks_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/risks/risk.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_risk_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_risks_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'risks_event.dart';

part 'risks_state.dart';

class RisksBloc extends Bloc<RisksEvent, RisksState> {
  final GetRisksUseCase _getRisksUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectStatusUseCase _getProjectStatusUseCase;
  final GetRiskByIdUseCase _getRiskByIdUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  List<Phase> phases = [];
  List<Status> status = [];
  List<ProjectType> projectTypes = [];
  List<Risk> risks = List.empty(growable: true);

  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  Status selectedStatus = const Status();
  ProjectType selectedProjectType = const ProjectType();
  DateTime? selectedFromDatetime = DateTime(
    2020,
    1,
    1,
  );
  DateTime? selectedToDatetime;

  RisksBloc(
    this._getRisksUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getProjectStatusUseCase,
    this._getRiskByIdUseCase,
    this._getProjectTypesUseCase,
  ) : super(RisksInitial()) {
    on<GetRisksEvent>(_onGetRisksEvent);
    on<SearchRisksEvent>(_onSearchRisksEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetStatusEvent>(_onGetStatusEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetRiskByIdEvent>(_onGetRiskByIdEvent);
  }

  FutureOr<void> _onGetRisksEvent(
      GetRisksEvent event, Emitter<RisksState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowSkeletonState());
      risks.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getRisksUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      risks.addAll(dataState.data?.risks ?? []);
      emit(GetRisksSuccessState(risks: risks, language: language));
    } else {
      emit(GetRisksFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSearchRisksEvent(
      SearchRisksEvent event, Emitter<RisksState> emit) {
    emit(SearchRisksState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<RisksState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<RisksState> emit) async {
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

  FutureOr<void> _onGetStatusEvent(
      GetStatusEvent event, Emitter<RisksState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (status.isEmpty) {
      final dataState = await _getProjectStatusUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        status = dataState.data ?? [];
        emit(GetStatusSuccessState(status: status));
      } else {
        emit(GetStatusFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetStatusSuccessState(status: status));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<RisksState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectStatusEvent(
      SelectStatusEvent event, Emitter<RisksState> emit) {
    selectedStatus = event.status;
    emit(SelectStatusState(status: selectedStatus));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<RisksState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<RisksState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<RisksState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetRiskByIdEvent(
      GetRiskByIdEvent event, Emitter<RisksState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getRiskByIdUseCase(
      event.riskId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetRiskByIdSuccessState(risk: dataState.data ?? Risk()));
    } else {
      emit(
        GetRiskByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectProjectTypeEvent(
      SelectProjectTypeEvent event, Emitter<RisksState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<RisksState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (projectTypes.isEmpty) {
      final dataState = await _getProjectTypesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        projectTypes = dataState.data ?? [];
        emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
      } else {
        emit(GetProjectTypesFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
    }
    emit(HideLoadingState());

  }
}
