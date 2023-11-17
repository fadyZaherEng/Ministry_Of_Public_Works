import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/variation/request/variations_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/variations/variation.dart';
import 'package:aim/src/domain/usecases/get_impact_on_cost_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_variation_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_variations_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'variation_event.dart';

part 'variation_state.dart';

class VariationBloc extends Bloc<VariationEvent, VariationState> {
  final GetVariationsUseCase _getVariationsUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetImpactOnCostStatusUseCase _getImpactOnCostStatusUseCase;
  final GetVariationByIdUseCase _getVariationByIdUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  List<Phase> phases = [];
  List<Status> status = [];
  List<ProjectType> projectTypes = [];
  List<Variation> variations = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Status selectedStatus = const Status();
  Phase selectedPhase = const Phase();
  ProjectType selectedProjectType = const ProjectType();
  DateTime? selectedFromDatetime = DateTime(
    2020,
    1,
    1,
  );
  DateTime? selectedToDatetime;

  VariationBloc(
    this._getVariationsUseCase,
    this._getLanguageUseCase,
    this._getImpactOnCostStatusUseCase,
    this._getVariationByIdUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
  ) : super(VariationInitial()) {
    on<GetVariationsEvent>(_onGetVariationsEvent);
    on<SearchVariationsEvent>(_onSearchVariationsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetStatusEvent>(_onGetStatusEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<GetVariationByIdEvent>(_onGetVariationByIdEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetVariationsEvent(
      GetVariationsEvent event, Emitter<VariationState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      variations.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getVariationsUseCase(
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

  FutureOr<void> _onSearchVariationsEvent(
      SearchVariationsEvent event, Emitter<VariationState> emit) {
    emit(SearchVariationsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<VariationState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetStatusEvent(
      GetStatusEvent event, Emitter<VariationState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (status.isEmpty) {
      final dataState = await _getImpactOnCostStatusUseCase(
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

  FutureOr<void> _onSelectStatusEvent(
      SelectStatusEvent event, Emitter<VariationState> emit) {
    selectedStatus = event.status;
    emit(SelectStatusState(status: selectedStatus));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<VariationState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<VariationState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<VariationState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetVariationByIdEvent(
      GetVariationByIdEvent event, Emitter<VariationState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getVariationByIdUseCase(
      event.variationId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetVariationByIdSuccessState(
          variation: dataState.data ?? const Variation()));
    } else {
      emit(
        GetVariationByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<VariationState> emit) async {
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

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<VariationState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<VariationState> emit) async {
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

  FutureOr<void> _onSelectProjectTypeEvent(
      SelectProjectTypeEvent event, Emitter<VariationState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
