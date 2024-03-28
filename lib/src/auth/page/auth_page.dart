import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notification/core/auth_service.dart';
import 'package:notification/core/extensions/ext_build_context.dart';
import 'package:notification/core/widgets/app_button.dart';
import 'package:notification/core/widgets/app_sizer.dart';
import 'package:notification/src/auth/controller/auth_controller.dart';
import 'package:notification/src/home/page/home_page.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AuthController());

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppButton(
              onTap: () => controller.signIn(),
              btnName: "Login with google",
              icon: (Icons.g_mobiledata)),
          const HeightBox(12),
          AppButton(
              onTap: () {},
              btnName: "Login with facebook",
              icon: (Icons.facebook)),
          const HeightBox(12),
          AppButton(
              onTap: () {}, btnName: "Login with Email", icon: (Icons.email)),
        ],
      ).paddingAll(20),
    );
  }
}
