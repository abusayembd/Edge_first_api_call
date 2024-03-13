import 'package:get/get.dart';

import '../routes/routes.dart';

class OnBoardController extends GetxController {

  get onGoToHome => goToHomePage();
  goToHomePage() {
   Get.toNamed(Routes.homeScreen);
  }
  
}