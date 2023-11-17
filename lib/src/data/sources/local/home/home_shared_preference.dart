abstract class HomeSharedPreference {
  Future<bool> setPermission(String permission);

  Future<String> getPermission();
}
