import 'dart:ffi';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:aad_oauth/model/config.dart';
import 'package:aim/main.dart';
import 'package:aim/src/config/utils/constants.dart';
import 'package:flutter/material.dart';

class Login {
  static late AadOAuth oauth;

  static void init() {
    final Config config = Config(
      tenant: tenantId,
      clientId: clientId,
      scope: scope,
      redirectUri: redirectUri,
      navigatorKey: navigatorKey,
      loader: const Center(
        child: CircularProgressIndicator(),
      ),
    );
    oauth = AadOAuth(config);
  }

  static Future<void> login() async {
    await oauth.login(refreshIfAvailable: true);
  }

  static Future<void> logout() async {
    await oauth.logout();
  }
}
