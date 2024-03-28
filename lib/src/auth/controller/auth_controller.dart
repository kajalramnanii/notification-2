import 'package:get/get.dart';
import 'package:notification/core/auth_service.dart';
import 'package:notification/src/home/page/home_page.dart';

class AuthController extends GetxController {
  signIn() {
    AuthService.signInWithGoogle().then((value) {
      Get.off(() => const HomePage());
    });
  }
}
