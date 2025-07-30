import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
  );

  static final dark = ThemeData.dark().copyWith(
    primaryColor: Colors.blueGrey,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey, brightness: Brightness.dark),
  );
}
