import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/warranties/request/warranties_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/warranty_type.dart';
import 'package:aim/src/domain/entities/warranties/warranty.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranties_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranty_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_warranty_type_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'warranties_event.dart';

part 'warranties_state.dart';

class WarrantiesBloc extends Bloc<WarrantiesEvent, WarrantiesState> {
  final GetWarrantiesUseCase _getWarrantiesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetWarrantyTypeUseCase _getWarrantyTypeUseCase;
  final GetWarrantyByIdUseCase _getWarrantyByIdUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  List<Phase> phases = [];
  List<WarrantyType> warrantyTypes = [];
  List<Warranty> warranties = [];
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  WarrantyType selectedWarrantyType = const WarrantyType();
  DateTime? selectedFromDatetime = DateTime(
    2020,
    1,
    1,
  );
  DateTime? selectedToDatetime;

  WarrantiesBloc(
    this._getWarrantiesUseCase,
    this._getLanguageUseCase,
    this._getWarrantyTypeUseCase,
    this._getWarrantyByIdUseCase,
    this._getPhasesUseCase,
  ) : super(WarrantiesInitial()) {
    on<GetWarrantiesEvent>(_onGetWarrantiesEvent);
    on<SearchWarrantiesEvent>(_onSearchWarrantyTypeEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetWarrantyTypeEvent>(_onGetWarrantyTypeEvent);
    on<SelectWarrantyTypeEvent>(_onSelectWarrantyTypeEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<GetWarrantyByIdEvent>(_onGetWarrantyByIdEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetWarrantiesEvent(
      GetWarrantiesEvent event, Emitter<WarrantiesState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      warranties.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getWarrantiesUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      warranties.addAll(dataState.data?.warranties ?? []);
      emit(GetWarrantiesSuccessState(warranties: warranties));
    } else {
      emit(GetWarrantiesFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSearchWarrantyTypeEvent(
      SearchWarrantiesEvent event, Emitter<WarrantiesState> emit) {
    emit(SearchWarrantiesState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<WarrantiesState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetWarrantyTypeEvent(
      GetWarrantyTypeEvent event, Emitter<WarrantiesState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (warrantyTypes.isEmpty) {
      final dataState = await _getWarrantyTypeUseCase(
          FilterRequest(isEnglishLanguage: isLanguageEnglish(language)));
      if (dataState is DataSuccess) {
        warrantyTypes = dataState.data ?? [];
        emit(GetWarrantyTypesSuccessState(warrantyTypes: warrantyTypes));
      } else {
        emit(GetWarrantyTypesFailState(
            errorMessage: dataState.error?.message ?? "Try Again"));
      }
    } else {
      emit(GetWarrantyTypesSuccessState(warrantyTypes: warrantyTypes));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectWarrantyTypeEvent(
      SelectWarrantyTypeEvent event, Emitter<WarrantiesState> emit) {
    selectedWarrantyType = event.warrantyType;
    emit(SelectWarrantyTypeState(warrantyType: selectedWarrantyType));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<WarrantiesState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<WarrantiesState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<WarrantiesState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetWarrantyByIdEvent(
      GetWarrantyByIdEvent event, Emitter<WarrantiesState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getWarrantyByIdUseCase(
      event.warrantyId,
      isLanguageEnglish(language),
    );

    if (dataState is DataSuccess) {
      emit(GetWarrantyByIdSuccessState(
          warranty: dataState.data ?? const Warranty()));
    } else {
      emit(
        GetWarrantyByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<WarrantiesState> emit) async {
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
      SelectPhaseEvent event, Emitter<WarrantiesState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }
}
