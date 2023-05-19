import 'package:get/get.dart';

import '../modules/home_🏠/bindings/home_binding.dart';
import '../modules/home_🏠/views/home_view.dart';
import '../modules/login_🔑/bindings/login_binding.dart';
import '../modules/login_🔑/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.login;
  static const home = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
