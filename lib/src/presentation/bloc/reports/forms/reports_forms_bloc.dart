import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/reports/report.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/get_report_by_id_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reports_forms_event.dart';

part 'reports_forms_state.dart';

class ReportsFormsBloc extends Bloc<ReportsFormsEvent, ReportsFormsState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final GetReportByIdUseCase _getReportByIdUseCase;

  ReportsFormsBloc(
    this._getLanguageUseCase,
    this._getReportByIdUseCase,
  ) : super(ReportsFormsInitial()) {
    on<GetReportByIdEvent>(_onGetReportByIdEvent);
  }

  FutureOr<void> _onGetReportByIdEvent(
      GetReportByIdEvent event, Emitter<ReportsFormsState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState =
        await _getReportByIdUseCase(event.id, isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetReportByIdSuccessState(report: dataState.data ?? Report()));
    } else {
      emit(GetReportByIdFailState(
          errorMessage: dataState.error?.message ?? "Try again"));
    }
    emit(HideLoadingState());
  }
}
