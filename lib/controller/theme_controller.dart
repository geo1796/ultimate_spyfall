import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController extends GetxController {
  final _themeMode = ThemeMode.light.obs;
  final _box = GetStorage();

  @override
  void onInit() async {
    if (_box.hasData('darkmode')) {
      final bool darkMode = _box.read('darkMode');
      if (darkMode) {
        themeMode = ThemeMode.dark;
      }
    }
    super.onInit();
  }

  bool get isDark {
    return themeMode == ThemeMode.dark;
  }

  ThemeMode get themeMode {
    return _themeMode.value;
  }

  set themeMode(ThemeMode t) {
    _themeMode.value = t;
  }

  Future<void> toggleTheme() async {
    if (themeMode == ThemeMode.dark) {
      themeMode = ThemeMode.light;
    } else {
      themeMode = ThemeMode.dark;
    }
    await _box.write('darkMode', themeMode == ThemeMode.dark);
  }
}
