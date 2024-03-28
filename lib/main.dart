import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/core/auth_service.dart';
import 'package:notification/core/config/app_config.dart';
import 'package:notification/firebase_options.dart';
import 'package:notification/src/auth/page/auth_page.dart';
import 'package:notification/src/home/page/home_page.dart';

void main() async {
  AppConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: AuthService.isUserLoggedIn ? const HomePage() : const AuthPage(),
    );
  }
}
