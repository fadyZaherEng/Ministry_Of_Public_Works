import 'dart:convert';

import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    debugPrint(
        "REQUEST [${' '}${options.method}${' '}] ${' '} URL: ${options.baseUrl + options.path} ${jsonEncode(options.data)} \n ${options.headers} \n ${options.queryParameters.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    debugPrint(
        "RESPONSE [${' '}${response.statusCode}${' '}]${'\n'}${jsonEncode(response.data)}");
    // if(response.data['data'] is String){
    //   response.data['data'] = null;
    // }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    // if (err.response?.statusCode == 401) {
    //   await Login.login();
    //   String? accessToken = await Login.oauth.getAccessToken();
    //   if (accessToken != null) {
    //     token = "Bearer $accessToken";
    //   }
    //
    //   _retry(err.requestOptions);
    // }
    debugPrint(
        "ERROR [${' '}${err.response?.statusCode}${' '}]${'\n'} error message =>"
        " ${err.response.toString()} ${'\n'} error header =>  \n $err");
    return super.onError(err, handler);
  }


  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: requestOptions.headers,
  //   );
  //   return Dio().request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }
}
