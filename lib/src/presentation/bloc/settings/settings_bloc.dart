import 'dart:async';

import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:aim/src/domain/usecases/set_language_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';

part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  SettingsBloc(
    this._getLanguageUseCase,
    this._setLanguageUseCase,
  ) : super(const SettingsInitial()) {
    on<GetDefaultLanguageEvent>(_onGetDefaultLanguageEvent);
    on<ChangeLanguageEvent>(_onChangeLanguageEvent);
  }

  FutureOr<void> _onGetDefaultLanguageEvent(
      GetDefaultLanguageEvent event, Emitter<SettingsState> emit) async {
    emit(GetDefaultLanguageState(
      languageCode: await _getLanguageUseCase(),
    ));
  }

  FutureOr<void> _onChangeLanguageEvent(
      ChangeLanguageEvent event, Emitter<SettingsState> emit) async {
    await _setLanguageUseCase(event.languageCode);
    emit(ChangeLanguageState(languageCode: event.languageCode));
  }
}
