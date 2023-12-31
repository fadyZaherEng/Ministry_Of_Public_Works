import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/milestones/request/milestones_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/milestones/milestone.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_milestone_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_milestones_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'milestones_event.dart';

part 'milestones_state.dart';

class MilestonesBloc extends Bloc<MilestonesEvent, MilestonesState> {
  final GetMilestonesUseCase _getMilestonesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectStatusUseCase _getProjectStatusUseCase;
  final GetMilestoneByIdUseCase _getMilestoneByIdUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  List<Phase> phases = [];
  List<Status> status = [];
  List<ProjectType> projectTypes = [];
  List<Milestone> milestones = List.empty(growable: true);

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

  MilestonesBloc(
    this._getMilestonesUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getProjectStatusUseCase,
    this._getMilestoneByIdUseCase,
    this._getProjectTypesUseCase,
  ) : super(MilestonesInitial()) {
    on<GetMilestonesEvent>(_onGetMilestonesEvent);
    on<SearchMilestonesEvent>(_onSearchMilestonesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetStatusEvent>(_onGetStatusEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetMilestoneByIdEvent>(_onGetMilestoneByIdEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
  }

  FutureOr<void> _onGetMilestonesEvent(
      GetMilestonesEvent event, Emitter<MilestonesState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      milestones.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getMilestonesUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      milestones.addAll(dataState.data?.milestones ?? []);
      emit(GetMilestonesSuccessState(milestones: milestones));
    } else {
      emit(GetMilestonesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSearchMilestonesEvent(
      SearchMilestonesEvent event, Emitter<MilestonesState> emit) {
    emit(SearchMilestonesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<MilestonesState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<MilestonesState> emit) async {
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
      GetStatusEvent event, Emitter<MilestonesState> emit) async {
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
      SelectPhaseEvent event, Emitter<MilestonesState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectStatusEvent(
      SelectStatusEvent event, Emitter<MilestonesState> emit) {
    selectedStatus = event.status;
    emit(SelectStatusState(status: selectedStatus));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<MilestonesState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<MilestonesState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<MilestonesState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetMilestoneByIdEvent(
      GetMilestoneByIdEvent event, Emitter<MilestonesState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getMilestoneByIdUseCase(
      event.milestoneId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetMilestoneByIdSuccessState(
          milestone: dataState.data ?? const Milestone()));
    } else {
      emit(
        GetMilestoneByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<MilestonesState> emit) async {
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
      SelectProjectTypeEvent event, Emitter<MilestonesState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
