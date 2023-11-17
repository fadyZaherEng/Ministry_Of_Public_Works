import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/config/utils/sort.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/filter/request/filter_request.dart';
import 'package:aim/src/data/sources/remote/aim/payments/request/payments_request.dart';
import 'package:aim/src/domain/entities/filter/phase.dart';
import 'package:aim/src/domain/entities/filter/project_type.dart';
import 'package:aim/src/domain/entities/filter/status.dart';
import 'package:aim/src/domain/entities/payments/payment.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_payment_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_payment_status_use_case.dart';
import 'package:aim/src/domain/usecases/get_payments_use_case.dart';
import 'package:aim/src/domain/usecases/get_phases_use_case.dart';
import 'package:aim/src/domain/usecases/get_project_types_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'payments_event.dart';

part 'payments_state.dart';

class PaymentsBloc extends Bloc<PaymentsEvent, PaymentsState> {
  final GetPaymentsUseCase _getPaymentsUseCase;
  final GetLanguageUseCase _getLanguageUseCase;
  final GetPhasesUseCase _getPhasesUseCase;
  final GetPaymentStatusUseCase _getPaymentStatusUseCase;
  final GetPaymentByIdUseCase _getPaymentByIdUseCase;
  final GetProjectTypesUseCase _getProjectTypesUseCase;

  List<Phase> phases = [];
  List<Status> status = [];
  List<ProjectType> projectTypes = [];
  List<Payment> payments = List.empty(growable: true);

  Sort selectedSort = sorts.first;
  Phase selectedPhase = const Phase();
  Status selectedStatus = const Status();
  ProjectType selectedProjectType = const ProjectType();
  DateTime? selectedFromDatetime;
  DateTime? selectedToDatetime;

  PaymentsBloc(
    this._getPaymentsUseCase,
    this._getLanguageUseCase,
    this._getPhasesUseCase,
    this._getPaymentStatusUseCase,
    this._getPaymentByIdUseCase,
    this._getProjectTypesUseCase,
  ) : super(PaymentsInitial()) {
    on<GetPaymentsEvent>(_onGetPaymentsEvent);
    on<SearchPaymentsEvent>(_onSearchPaymentsEvent);
    on<SelectSortEvent>(_onSelectSortEvent);
    on<GetPhasesEvent>(_onGetPhasesEvent);
    on<GetStatusEvent>(_onGetStatusEvent);
    on<SelectPhaseEvent>(_onSelectPhaseEvent);
    on<SelectStatusEvent>(_onSelectStatusEvent);
    on<SelectFromDateEvent>(_onSelectFromDateEvent);
    on<SelectToDateEvent>(_onSelectToDateEvent);
    on<GetPaymentByIdEvent>(_onGetPaymentByIdEvent);
    on<NavigateBackEvent>(_onNavigateBackEvent);
    on<GetProjectTypesEvent>(_onGetProjectTypesEvent);
    on<SelectProjectTypeEvent>(_onSelectProjectTypeEvent);
  }

  FutureOr<void> _onGetPaymentsEvent(
      GetPaymentsEvent event, Emitter<PaymentsState> emit) async {
    String language = await _getLanguageUseCase();
    if (event.request.pageNo == 1) {
      payments.clear();
      emit(ShowSkeletonState());
    } else {
      emit(ShowLoadingState());
    }
    final dataState = await _getPaymentsUseCase(
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

  FutureOr<void> _onSearchPaymentsEvent(
      SearchPaymentsEvent event, Emitter<PaymentsState> emit) {
    emit(SearchPaymentsState(keyword: event.keyword));
  }

  FutureOr<void> _onSelectSortEvent(
      SelectSortEvent event, Emitter<PaymentsState> emit) {
    selectedSort = event.sort;
    emit(SelectSortState(sort: selectedSort));
  }

  FutureOr<void> _onGetPhasesEvent(
      GetPhasesEvent event, Emitter<PaymentsState> emit) async {
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
      GetStatusEvent event, Emitter<PaymentsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    if (status.isEmpty) {
      final dataState = await _getPaymentStatusUseCase(
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
      SelectPhaseEvent event, Emitter<PaymentsState> emit) {
    selectedPhase = event.phase;
    emit(SelectPhaseState(phase: selectedPhase));
  }

  FutureOr<void> _onSelectStatusEvent(
      SelectStatusEvent event, Emitter<PaymentsState> emit) {
    selectedStatus = event.status;
    emit(SelectStatusState(status: selectedStatus));
  }

  FutureOr<void> _onSelectFromDateEvent(
      SelectFromDateEvent event, Emitter<PaymentsState> emit) {
    selectedFromDatetime = event.fromDateTime;
    emit(SelectFromDateState(fromDate: selectedFromDatetime));
  }

  FutureOr<void> _onSelectToDateEvent(
      SelectToDateEvent event, Emitter<PaymentsState> emit) {
    selectedToDatetime = event.toDateTime;
    emit(SelectToDateState(toDate: selectedToDatetime));
  }

  FutureOr<void> _onNavigateBackEvent(
      NavigateBackEvent event, Emitter<PaymentsState> emit) {
    emit(const NavigateBackState());
  }

  FutureOr<void> _onGetPaymentByIdEvent(
      GetPaymentByIdEvent event, Emitter<PaymentsState> emit) async {
    String language = await _getLanguageUseCase();

    emit(ShowLoadingState());
    final dataState = await _getPaymentByIdUseCase(
      event.paymentId,
      isLanguageEnglish(language),
    );
    if (dataState is DataSuccess) {
      emit(GetPaymentByIdSuccessState(payment: dataState.data ?? Payment()));
    } else {
      emit(
        GetPaymentByIdFailState(
          errorMessage: dataState.error?.message ?? "Try Again",
        ),
      );
    }
    emit(HideLoadingState());
  }

  FutureOr<void> _onGetProjectTypesEvent(
      GetProjectTypesEvent event, Emitter<PaymentsState> emit) async {
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
      SelectProjectTypeEvent event, Emitter<PaymentsState> emit) {
    selectedProjectType = event.projectType;
    emit(SelectProjectTypeState(projectType: selectedProjectType));
  }
}
