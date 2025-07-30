import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeToggle extends StatelessWidget {
  final box = GetStorage();
  final keyName = 'isDarkMode';

  @override
  Widget build(BuildContext context) {
    bool isDark = box.read(keyName) ?? false;

    return SwitchListTile(
      title: Text("Dark Mode"),
      value: isDark,
      onChanged: (value) {
        Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
        box.write(keyName, value);
      },
    );
  }
}
