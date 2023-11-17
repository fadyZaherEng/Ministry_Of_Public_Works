abstract class LanguageRepository {
  Future<bool> setLanguage(String languageCode);

  Future<String> getLanguage();
}
