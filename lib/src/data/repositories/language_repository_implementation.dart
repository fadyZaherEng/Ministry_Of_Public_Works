import 'package:aim/src/data/sources/local/language_shared_preference.dart';
import 'package:aim/src/domain/repositories/language_repository.dart';

class LanguageRepositoryImplementation extends LanguageRepository {
  final LanguageSharedPreference sharedPreference;

  LanguageRepositoryImplementation(this.sharedPreference);

  @override
  Future<String> getLanguage() {
    return sharedPreference.getLanguage();
  }

  @override
  Future<bool> setLanguage(String languageCode) async {
    return await sharedPreference.setLanguage(languageCode);
  }
}
