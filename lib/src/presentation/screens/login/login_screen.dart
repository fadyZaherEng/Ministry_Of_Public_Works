// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:aim/injector.dart';
import 'package:aim/src/config/routes/app_routes.dart';
import 'package:aim/src/config/themes/color_scheme.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:aim/src/config/utils/login.dart';
import 'package:aim/src/core/interceptor.dart';
import 'package:aim/src/domain/usecases/set_permission_use_case.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    Login.init();
    login();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: const Scaffold(
        backgroundColor: ColorSchema.white,
      ),
    );
  }

  void login() async {
    await Login.login();
    String? accessToken = await Login.oauth.getAccessToken();
    if (accessToken == null) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      token = "Bearer $accessToken";
      Dio dio = Dio()
        ..options.baseUrl = baseUrl
        ..options.headers["Authorization"] = token
        ..options.headers['Content-Type'] = 'application/json'
        ..options.headers['Accept'] = '*/*'
        ..interceptors.add(CustomInterceptors());

      Response response =
          await dio.get("$getUserPermissionEndPoint?isEnglishLanguage=true");
      try {
        SetPermissionUseCase(injector())(response.data['data']['name']);
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false,
            arguments: response.data['data']['name']);
      } catch (ex) {
        Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.main, (route) => false,
            arguments: "");
      }
    }
  }

  void showError(dynamic ex) {
    print("Error: ${ex.toString()}");
  }
}
