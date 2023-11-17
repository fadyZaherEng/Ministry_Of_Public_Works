part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class SettingsInitial extends SettingsState {
  const SettingsInitial();
}

class GetDefaultLanguageState extends SettingsState {
  final String languageCode;

  const GetDefaultLanguageState({
    required this.languageCode,
  });
}

class ChangeLanguageState extends SettingsState {
  final String languageCode;

  const ChangeLanguageState({
    required this.languageCode,
  });
}
