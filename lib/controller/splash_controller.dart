import 'dart:async';

import 'package:first_api_app/routes/routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
  //
  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void _goToScreen() {
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(Routes.onboardScreen);
    });
  }
}
