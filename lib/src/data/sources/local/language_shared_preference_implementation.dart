import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/preference_key.dart';
import 'package:aim/src/data/sources/local/language_shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageSharedPreferenceImplementation extends LanguageSharedPreference {
  final SharedPreferences sharedPreferences;

  LanguageSharedPreferenceImplementation(this.sharedPreferences);

  @override
  Future<String> getLanguage() async {
    return sharedPreferences.getString(PreferenceKey.language) ?? englishCode;
  }

  @override
  Future<bool> setLanguage(String languageCode) async {
    return await sharedPreferences.setString(
        PreferenceKey.language, languageCode);
  }
}
