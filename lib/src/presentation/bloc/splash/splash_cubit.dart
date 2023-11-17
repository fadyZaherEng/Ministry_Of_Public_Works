import 'package:aim/generated/l10n.dart';
import 'package:aim/src/domain/usecases/get_language_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;

  SplashCubit(
    this._getLanguageUseCase,
  ) : super(S.delegate.supportedLocales.first) {
    getLanguage();
  }

  Future<void> getLanguage() async {
    final language = await _getLanguageUseCase();
    ///////////////////////////
    ////////////////////////
    print("");
    emit(Locale(language));
  }
}
