import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/penalties/request/penalties_request.dart';
import 'package:aim/src/domain/entities/filter/penalty_type.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/penalties/penalty.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalties_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalty_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_penalty_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'penalties_event.dart';
part 'penalties_state.dart';

class PenaltiesBloc extends Bloc<PenaltiesEvent, PenaltiesState> {
  final GetPenaltiesUseCase _getPenaltiesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPenaltyTypesUseCase _getPenaltyTypesUseCase;
  final GetPenaltyByIdUseCase _getPenaltyByIdUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;

  List<ProjectType> projectTypes = [];
  ProjectType selectedProjectType = const ProjectType();
  List<Phase> phases = [];
  List<PenaltyType> penaltyTypes = [];
  List<Penalty> penalties = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  PenaltyType selectedPenaltyType = const PenaltyType();
  Phase selectedPhase = const Phase();
  DateTime? selectedFromDatetime = DateTime(
    2020,
    1,
    1,
  );

  DateTime? selectedToDatetime;

  PenaltiesBloc(
    this._getPenaltiesUseCase,
    this._getLanguageUseCase,
    this._getPenaltyTypesUseCase,
    this._getPenaltyByIdUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
  ) : super(PenaltiesInitial()) {
    on<GetPenaltiesEvent>(_onGetPenaltiesEvent);
    on<SearchPenaltiesEvent>(_onSearchPenaltiesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPenaltyTypesEvent>(_onGetPenaltyTypesEvent);
    on<SelectPenaltyTypeEvent>(_onSelectPenaltyTypeEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<GetPenaltyByIdEvent>(_onGetPenaltyByIdEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetPenaltiesEvent(
      GetPenaltiesEvent event, Emitter<PenaltiesState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      penalties.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getPenaltiesUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      penalties.addAll(dataState.data?.penalties ?? []);
      emit(GetPenaltiesSuccessState(penalties: penalties));
    } else {
      emit(GetPenaltiesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSearchPenaltiesEvent(
      SearchPenaltiesEvent event, Emitter<PenaltiesState> emit) {
    emit(SearchPenaltiesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<PenaltiesState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPenaltyTypesEvent(
      GetPenaltyTypesEvent event, Emitter<PenaltiesState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (penaltyTypes.isEmpty) {
      final dataState = await _getPenaltyTypesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        penaltyTypes = dataState.data ?? [];
        emit(GetPenaltyTypesSuccessState(penaltyTypes: penaltyTypes));
      } else {
        emit(GetPenaltyTypesFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetPenaltyTypesSuccessState(penaltyTypes: penaltyTypes));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectPenaltyTypeEvent(
      SelectPenaltyTypeEvent event, Emitter<PenaltiesState> emit) {
    selectedPenaltyType = event.penaltyType;
    emit(SelectPenaltyTypeState(penaltyType: selectedPenaltyType));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<PenaltiesState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<PenaltiesState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<PenaltiesState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetPenaltyByIdEvent(
      GetPenaltyByIdEvent event, Emitter<PenaltiesState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getPenaltyByIdUseCase(
      event.penaltyId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetPenaltyByIdSuccessState(
          penalty: dataState.data ?? const Penalty()));
    } else {
      emit(
        GetPenaltyByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<PenaltiesState> emit) async {
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
      SelectPhaseEvent event, Emitter<PenaltiesState> emit) async {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<PenaltiesState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (projectTypes.isEmpty) {
      final datastate = await _getProjectTypesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        projectTypes = datastate.data ?? [];
        emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
      } else {
        emit(GetProjectTypesFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetProjectTypesSuccessState(projectTypes: projectTypes));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectProjectTypeEvent(
      SelectProjectTypeEvent event, Emitter<PenaltiesState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
