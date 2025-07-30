import 'package:get/get.dart';
import '../presentation/pages/login_page.dart';
import '../presentation/pages/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.LOGIN, page: () => LoginPage()),
    GetPage(name: AppRoutes.HOME, page: () => HomePage()),
  ];
}
