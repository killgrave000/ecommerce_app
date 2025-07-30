import 'package:ecommerce_app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get_storage/get_storage.dart';

import 'core/bindings/initial_binding.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  // Set your Stripe publishable key
  Stripe.publishableKey =
      'pk_test_51RqaTk2OQIalIgHw8wCyDwoyRKvxP6ZWE7waRzLBHtAUy8G6iyw1jUSUTMfX3FbMoVbYJ35sxwFoZ6KxnVnm87Kw008CMEYkjj';

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _box = GetStorage();
  final _key = 'isDarkMode';

  ThemeMode get themeMode => _loadTheme() ? ThemeMode.dark : ThemeMode.light;

  bool _loadTheme() => _box.read(_key) ?? false;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      initialBinding: InitialBinding(),
      initialRoute: AppRoutes.LOGIN,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}
