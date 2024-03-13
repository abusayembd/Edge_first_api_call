import 'package:first_api_app/views/splash/splash_screen.dart';
import 'package:get/get.dart';

import '../bindings/splash_binding.dart';
import '../views/home_page/get_posts.dart';
import '../views/home_page/home_screen.dart';
import '../views/on_board/on_board_screen.dart';

class Routes {
// Route Names
  static const String splashScreen = '/splashScreen';
  static const String onboardScreen = '/onboardScreen';
  static const String homeScreen = '/homeScreen';

  static var list = [
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(name: onboardScreen, page: () =>  OnBoardScreen()),
    GetPage(name: homeScreen, page: () =>  HomeScreen()),
  ];
}
