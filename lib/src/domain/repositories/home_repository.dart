import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/permission.dart';
import 'package:aim/src/domain/entities/home/user.dart';

abstract class HomeRepository {
  Future<DataState<Home>> getHomeCounts();

  Future<DataState<User>> getUser();

  Future<DataState<UserPermission>> getUserPermission(bool isEnglishLanguage);

  Future<bool> setUserPermission(String permission);

  Future<String> getLocalUserPermission();
}
