import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/preference_key.dart';
import 'package:aim/src/data/sources/local/home/home_shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeSharedPreferenceImplementation extends HomeSharedPreference {
  final SharedPreferences sharedPreferences;

  HomeSharedPreferenceImplementation(this.sharedPreferences);

  @override
  Future<String> getPermission() async {
    return sharedPreferences.getString(PreferenceKey.permission) ?? "";
  }

  @override
  Future<bool> setPermission(String permission) async {
    return await sharedPreferences.setString(
        PreferenceKey.language, permission);
  }
}
