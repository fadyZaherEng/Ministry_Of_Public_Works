part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object?> get props => [identityHashCode(this)];
}

class GetDefaultLanguageEvent extends SettingsEvent {}

class ChangeLanguageEvent extends SettingsEvent {
  final String languageCode;

  const ChangeLanguageEvent({
    required this.languageCode,
  });
}
