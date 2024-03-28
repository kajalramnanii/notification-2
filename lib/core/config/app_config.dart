import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification/core/auth_service.dart';
import 'package:notification/firebase_options.dart';

class AppConfig {
  /// API Config
  static const Duration timeout = Duration(seconds: 60);
  static const logNetworkRequest = true;
  static const logNetworkRequestHeader = true;
  static const logNetworkRequestBody = true;
  static const logNetworkResponseHeader = false;
  static const logNetworkResponseBody = true;
  static const logNetworkError = true;

  static init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    AuthService.checkLoginStatus();
  }
}
