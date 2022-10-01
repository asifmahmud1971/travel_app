import 'package:get/get.dart';
import 'package:travel_app/Page/home.dart';
import 'package:travel_app/Slash/splashscreen.dart';
import 'package:travel_app/routes/route_name.dart';

class Routes {
  static String initial = SLASH;

  static final paths = [
    GetPage(name: HOME, page: () => const Home()),
    GetPage(name: SLASH, page: () => const SplashScreen()),
  ];
}
