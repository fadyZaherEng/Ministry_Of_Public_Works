import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_list_request.dart';
import 'package:aim/src/domain/entities/dashboards/indicator.dart';
import 'package:aim/src/domain/entities/dashboards/payments_chart.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_chart_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_list_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payments_dashboard_event.dart';

part 'payments_dashboard_state.dart';

class PaymentsDashboardBloc
    extends Bloc<PaymentsDashboardEvent, PaymentsDashboardState> {
  final GetPaymentsListUseCase _getPaymentsListUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPaymentsChartUseCase
      _getPaymentsChartUseCase;

  List<Phase> phases = [];
  List<ProjectType> sectors = [];
  List<Payment> payments = List.empty(growable: true);
  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  ProjectType selectedSector = const ProjectType();
  Indicator selectedIndicator = const Indicator();

  PaymentsDashboardBloc(
    this._getPaymentsListUseCase,
    this._getPhasesUseCase,
    this._getProjectTypesUseCase,
    this._getLanguageUseCase,
    this._getPaymentsChartUseCase,
  ) : super(PaymentsDashboardInitial()) {
    on<GetPaymentsEvent>(_onGetPaymentsEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetSectorsEvent>(_onGetSectorsEvent);
    on<SearchPaymentsEvent>(_onSearchPaymentsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectSectorEvent>(_onSelectSectorEvent);
    on<GetPaymentsChartEvent>(_onGetPaymentsChartEvent);
    on<SelectIndicatorEvent>(_onSelectIndicatorEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
  }

  FutureOr<void> _onGetPaymentsEvent(
      GetPaymentsEvent event, Emitter<PaymentsDashboardState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      emit(ShowLoadingState());
      payments.clear();
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getPaymentsListUseCase(
        event.request.copyWith(isEnglishLanguage: isLanguageEnglish(language)));
    if (dataState is DataSuccess) {
      payments.addAll(dataState.data?.payments ?? []);
      emit(GetPaymentsSuccessState(payments: payments));
    } else {
      emit(GetPaymentsFailState(
          errorMessage: dataState.error?.message ?? "Try Again"));
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<PaymentsDashboardState> emit) async {
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
      GetSectorsEvent event, Emitter<PaymentsDashboardState> emit) async {
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

  FutureOr<void> _onSearchPaymentsEvent(
      SearchPaymentsEvent event, Emitter<PaymentsDashboardState> emit) {
    emit(SearchPaymentsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<PaymentsDashboardState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onSelectPhaseEvent(
      SelectPhaseEvent event, Emitter<PaymentsDashboardState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectSectorEvent(
      SelectSectorEvent event, Emitter<PaymentsDashboardState> emit) {
    selectedSector = event.sector;
    emit(SelectSectorState(sector: selectedSector));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<PaymentsDashboardState> emit) {
    emit(NavigateBackState());
  }

  FutureOr<void> _onGetPaymentsChartEvent(
      GetPaymentsChartEvent event,
      Emitter<PaymentsDashboardState> emit) async {
    emit(ShowLoadingState());
    final dataState = await _getPaymentsChartUseCase(
      event.phaseId,
      event.sectorId,
      event.color,
    );
    if (dataState is DataSuccess) {
      emit(
        GetPaymentsChartSuccessState(
          paymentsChart: dataState.data ?? PaymentsChart(),
        ),
      );
    } else {
      emit(
        GetPaymentsChartFailState(
            errorMessage: dataState.error?.message ?? ""),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onSelectIndicatorEvent(SelectIndicatorEvent event, Emitter<PaymentsDashboardState> emit) {
    selectedIndicator = event.indicator;
    emit(SelectIndicatorState(indicator: selectedIndicator));
  }
}
