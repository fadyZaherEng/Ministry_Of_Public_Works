abstract class LanguageSharedPreference {
  Future<bool> setLanguage(String languageCode);

  Future<String> getLanguage();
}
