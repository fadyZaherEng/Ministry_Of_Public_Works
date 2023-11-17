import 'dart:async';

import 'package:aim/src/config/utils/helper.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/agreement/agreement.dart';
import 'package:aim/src/domain/usecases/get_agreement_by_id_use_case.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'agreement_form_event.dart';

part 'agreement_form_state.dart';

class AgreementFormBloc extends Bloc<AgreementFormEvent, AgreementFormState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final GetAgreementByIdUseCase _getAgreementByIdUseCase;

  AgreementFormBloc(
    this._getLanguageUseCase,
    this._getAgreementByIdUseCase,
  ) : super(AgreementFormInitial()) {
    on<GetAgreementByIdEvent>(_onGetAgreementByIdEvent);
  }

  FutureOr<void> _onGetAgreementByIdEvent(
      GetAgreementByIdEvent event, Emitter<AgreementFormState> emit) async {
    String language = await _getLanguageUseCase();
    emit(ShowLoadingState());
    final dataState =
        await _getAgreementByIdUseCase(event.id, isLanguageEnglish(language));
    if (dataState is DataSuccess) {
      emit(GetAgreementByIdSuccessState(
          agreement: dataState.data ?? Agreement()));
    } else {
      emit(GetAgreementByIdFailState(
          errorMessage: dataState.error?.message ?? "Try again"));
    }
    emit(HideLoadingState());
  }
}
