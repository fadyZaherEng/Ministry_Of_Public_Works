import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/reports/request/reports_request.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/domain/usecases/change_orientation_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_months_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_print_url_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_report_pdf_use_case.dart';
import 'package:aim/src/domain/usecases/get_reports_use_case.dart';
import 'package:aim/src/domain/usecases/get_years_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reports_event.dart';
part 'reports_state.dart';

class ReportsBloc extends Bloc<ReportsEvent, ReportsState> {
  final GetReportsUseCase _getReportsUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetMonthsUseCase _getMonthsUseCase;
  final GetYearsUseCase _getYearsUseCase;
  final GetReportPDFUseCase _getReportPDFUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetPrintUrlUseCase _getPrintUrlUseCase;
  final ChangeOrientationUseCase _changeOrientationUseCase;
  List<Phase> phases = [];
  List<Month> months = [];
  List<Year> years = [];
  List<ProjectType> projectTypes = [];
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedProjectType = const ProjectType();
  Month selectedMonth = const Month();
  Year selectedYear = const Year();
  List<Report> reports = List.empty(growable: true);

  ReportsBloc(
    this._getReportsUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getMonthsUseCase,
    this._getYearsUseCase,
    this._getReportPDFUseCase,
    this._getProjectTypesUseCase,
    this._getPrintUrlUseCase,
    this._changeOrientationUseCase,
  ) : super(ReportsInitial()) {
    on<GetReportsEvent>(_onGetReportsEvent);
    on<SearchReportsEvent>(_onSearchReportsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetMonthsEvent>(_onGetMonthsEvent);
    on<GetYearsEvent>(_onGetYearsEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectMonthEvent>(_onSelectMonthEvent);
    on<SelectYearEvent>(_onSelectYearEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetReportPDFEvent>(_onGetReportPDFEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
    on<GetPrintUrlEvent>(_onGetPrintUrlEvent);
    on<OpenPdfWebViewEvent>(_onOpenPdfWebViewEvent);
    on<ChangeDeviceOrientationEvent>(_onChangeDeviceOrientationEvent);
  }

  FutureOr<void> _onGetReportsEvent(
      GetReportsEvent event, Emitter<ReportsState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      reports.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getReportsUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      reports.addAll(dataState.data?.reports ?? []);
      emit(GetReportsSuccessState(reports: reports));
    } else {
      emit(GetReportsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<ReportsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (phases.isEmpty) {
      final datastate = await _getPhasesUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        phases = datastate.data ?? [];
        emit(GetPhasesSuccessState(phases: phases));
      } else {
        emit(GetPhasesFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetPhasesSuccessState(phases: phases));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetMonthsEvent(
      GetMonthsEvent event, Emitter<ReportsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (months.isEmpty) {
      final datastate = await _getMonthsUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        months = datastate.data ?? [];
        emit(GetMonthsSuccessState(months: months));
      } else {
        emit(GetMonthsFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetMonthsSuccessState(months: months));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetYearsEvent(
      GetYearsEvent event, Emitter<ReportsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (years.isEmpty) {
      final datastate = await _getYearsUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (datastate is DataSuccess) {
        years = datastate.data ?? [];
        emit(GetYearsSuccessState(years: years));
      } else {
        emit(GetYearsFailState(
            errorMessage: datastate.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetYearsSuccessState(years: years));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<ReportsState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSearchReportsEvent(
      SearchReportsEvent event, Emitter<ReportsState> emit) {
    emit(SearchReportsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<ReportsState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectMonthEvent(
      SelectMonthEvent event, Emitter<ReportsState> emit) {
    selectedMonth = event.month;
    emit(SelectMonthState(month: selectedMonth));
  }

  FutureOr<void> _onSelectYearEvent(
      SelectYearEvent event, Emitter<ReportsState> emit) {
    selectedYear = event.year;
    emit(SelectYearState(year: selectedYear));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<ReportsState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetReportPDFEvent(
      GetReportPDFEvent event, Emitter<ReportsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState =
        await _getReportPDFUseCase(event.reportId, isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetReportPDSuccessState(pdfUrl: dataState.data ?? ""));
    } else {
      emit(GetReportPDFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<ReportsState> emit) async {
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
      SelectProjectTypeEvent event, Emitter<ReportsState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }

  FutureOr<void> _onGetPrintUrlEvent(
      GetPrintUrlEvent event, Emitter<ReportsState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPrintUrlUseCase();
    if (dataState is DataSuccess) {
      emit(GetPrintUrlSuccessState(url: dataState.data ?? ''));
    } else {
      emit(GetPrintUrlFailState(errorMessage: dataState.error?.message ?? ""));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onOpenPdfWebViewEvent(
      OpenPdfWebViewEvent event, Emitter<ReportsState> emit) async {
    emit(
      OpenPdfWebViewState(
        pdfUrl: '${event.reportUrl}${event.reportId}',
        reportId: event.reportId,
      ),
    );
  }

  FutureOr<void> _onChangeDeviceOrientationEvent(
      ChangeDeviceOrientationEvent event, Emitter<ReportsState> emit) {
    _changeOrientationUseCase(event.deviceOrientationList);
  }
}
