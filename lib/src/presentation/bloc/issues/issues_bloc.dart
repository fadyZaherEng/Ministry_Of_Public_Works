import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/issues/request/issues_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/issues/issue.dart';
import 'package:aim/src/domain/usecases/get_issue_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_issues_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/presentation/bloc/penalties/penalties_bloc.dart';
import 'package:aim/src/presentation/bloc/penalties/penalties_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'issues_event.dart';

part 'issues_state.dart';

class IssuesBloc extends Bloc<IssuesEvent, IssuesState> {
  final GetIssuesUseCase _getIssuesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectStatusUseCase _getProjectStatusUseCase;
  final GetIssueByIdUseCase _getIssueByIdUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  List<Phase> phases = [];
  List<Status> status = [];
  List<ProjectType> projectTypes = [];
  List<Issue> issues = List.empty(growable: true);
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

  IssuesBloc(
    this._getIssuesUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getProjectStatusUseCase,
    this._getIssueByIdUseCase,
    this._getProjectTypesUseCase,
  ) : super(IssuesInitial()) {
    on<GetIssuesEvent>(_onGetIssuesEvent);
    on<SearchIssuesEvent>(_onSearchIssuesEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetStatusEvent>(_onGetStatusEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<GetIssueByIdEvent>(_onGetIssueByIdEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
  }

  FutureOr<void> _onGetIssuesEvent(
      GetIssuesEvent event, Emitter<IssuesState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      issues.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getIssuesUseCase(
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

  FutureOr<void> _onSearchIssuesEvent(
      SearchIssuesEvent event, Emitter<IssuesState> emit) {
    emit(SearchIssuesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<IssuesState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<IssuesState> emit) async {
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
      GetStatusEvent event, Emitter<IssuesState> emit) async {
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
      SelectPhaseEvent event, Emitter<IssuesState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectStatusEvent(
      SelectStatusEvent event, Emitter<IssuesState> emit) {
    selectedStatus = event.status;
    emit(SelectStatusState(status: selectedStatus));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<IssuesState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<IssuesState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onGetIssueByIdEvent(
      GetIssueByIdEvent event, Emitter<IssuesState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getIssueByIdUseCase(
      event.issueId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetIssueByIdSuccessState(issue: dataState.data ?? Issue()));
    } else {
      emit(
        GetIssueByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<IssuesState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<IssuesState> emit) async {
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
      SelectProjectTypeEvent event, Emitter<IssuesState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
