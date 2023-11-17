import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/agreements/request/agreements_request.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/entities/filter/month.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/year.dart';
import 'package:aim/src/domain/usecases/get_agreement_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_agreements_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_months_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:aim/src/domain/usecases/get_years_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'agreement_event.dart';

part 'agreement_state.dart';

class AgreementBloc extends Bloc<AgreementEvent, AgreementState> {
  final GetAgreementsUseCase _getAgreementsUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetMonthsUseCase _getMonthsUseCase;
  final GetYearsUseCase _getYearsUseCase;
  final GetAgreementByIdUseCase _getAgreementByIdUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;

  List<Month> months = [];
  List<Year> years = [];
  List<ProjectType> projectTypes = [];
  List<Agreement> agreements = List.empty(growable: true);

  Sort selectedSort = sorts.first;
  ProjectType selectedProjectType = ProjectType();
  Month selectedMonth = Month();
  Year selectedYear = Year();

  AgreementBloc(
    this._getAgreementsUseCase,
    this._getLanguageUseCase,
    this._getMonthsUseCase,
    this._getYearsUseCase,
    this._getAgreementByIdUseCase,
    this._getProjectTypesUseCase,
  ) : super(AgreementInitial()) {
    on<GetAgreementsEvent>(_onGetAgreementsEvent);
    on<SearchAgreementsEvent>(_onSearchAgreementsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetMonthsEvent>(_onGetMonthsEvent);
    on<GetYearsEvent>(_onGetYearsEvent);
    on<SelectMonthEvent>(_onSelectMonthEvent);
    on<SelectYearEvent>(_onSelectYearEvent);
    on<GetAgreementByIdEvent>(_onGetAgreementByIdEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesUseCase);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
  }

  FutureOr<void> _onGetAgreementsEvent(
      GetAgreementsEvent event, Emitter<AgreementState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      agreements.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getAgreementsUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      agreements.addAll(dataState.data?.agreements ?? []);
      emit(GetAgreementsSuccessState(agreements: agreements));
    } else {
      emit(GetAgreementsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetMonthsEvent(
      GetMonthsEvent event, Emitter<AgreementState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (months.isEmpty) {
      final dataState = await _getMonthsUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        months = dataState.data ?? [];
        emit(GetMonthsSuccessState(months: months));
      } else {
        emit(GetMonthsFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetMonthsSuccessState(months: months));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetYearsEvent(
      GetYearsEvent event, Emitter<AgreementState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (years.isEmpty) {
      final dataState = await _getYearsUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        years = dataState.data ?? [];
        emit(GetYearsSuccessState(years: years));
      } else {
        emit(GetYearsFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetYearsSuccessState(years: years));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<AgreementState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSearchAgreementsEvent(
      SearchAgreementsEvent event, Emitter<AgreementState> emit) {
    emit(SearchAgreementState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectMonthEvent(
      SelectMonthEvent event, Emitter<AgreementState> emit) {
    selectedMonth = event.month;
    emit(SelectMonthState(month: selectedMonth));
  }

  FutureOr<void> _onSelectYearEvent(
      SelectYearEvent event, Emitter<AgreementState> emit) {
    selectedYear = event.year;
    emit(SelectYearState(year: selectedYear));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<AgreementState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetAgreementByIdEvent(
      GetAgreementByIdEvent event, Emitter<AgreementState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getAgreementByIdUseCase(
      event.agreementId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetAgreementByIdSuccessState(
          agreement: dataState.data ?? Agreement()));
    } else {
      emit(
        GetAgreementByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectTypesUseCase(
      GetProjectTypesEvent event, Emitter<AgreementState> emit) async {
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
      SelectProjectTypeEvent event, Emitter<AgreementState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
