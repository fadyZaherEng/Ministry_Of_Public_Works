import 'dart:io';

import 'package:aim/src/config/utils/preference_key.dart';
import 'package:aim/src/core/resources/data_state.dart';
import 'package:aim/src/data/sources/remote/aim/home/home_api_service.dart';
import 'package:aim/src/domain/entities/home/home.dart';
import 'package:aim/src/domain/entities/home/permission.dart';
import 'package:aim/src/domain/entities/home/user.dart';
import 'package:aim/src/domain/repositories/home_repository.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeRepositoryImplementation extends HomeRepository {
  final HomeApiService _homeApiService;
  final SharedPreferences _sharedPreferences;

  HomeRepositoryImplementation(this._homeApiService, this._sharedPreferences);

  @override
  Future<DataState<Home>> getHomeCounts() async {
    try {
      final httpResponse = await _homeApiService.getHomeCounts();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<User>> getUser() async {
    try {
      final httpResponse = await _homeApiService.getUser();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        if (httpResponse.data.data != null) {
          return DataSuccess(httpResponse.data.data!.data!);
        } else {
          return DataFailed(DioError(
              error: httpResponse.data.errorMessage,
              requestOptions: httpResponse.response.requestOptions,
              response: httpResponse.response,
              type: DioErrorType.response));
        }
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<UserPermission>> getUserPermission(
      bool isEnglishLanguage) async {
    try {
      final httpResponse =
          await _homeApiService.getUserPermission(isEnglishLanguage);
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data.data!);
      } else {
        return DataFailed(DioError(
            error: httpResponse.response.statusMessage,
            requestOptions: httpResponse.response.requestOptions,
            response: httpResponse.response,
            type: DioErrorType.response));
      }
    } on DioError catch (e) {
      return DataFailed(e);
    }
  }

  @override
  Future<bool> setUserPermission(String permission) async {
    return await _sharedPreferences.setString(
        PreferenceKey.permission, permission);
  }

  @override
  Future<String> getLocalUserPermission() async {
    return _sharedPreferences.getString(PreferenceKey.permission) ?? "";
  }
}
