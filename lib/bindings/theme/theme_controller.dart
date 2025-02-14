import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';

class ThemeController extends GetxController {
  final _box = Get.find<GetStorage>();
  
  final mode = ThemeMode.light.obs;
  
  bool get isDark => mode.value == ThemeMode.dark;

  @override
  void onInit() {
    super.onInit();

    if (!_box.hasData(StorageKeys.darkMode)) return;

    final bool darkMode = _box.read(StorageKeys.darkMode);

    if (darkMode) mode.value = ThemeMode.dark;
  }

  void toggleTheme() {
    if (mode.value == ThemeMode.dark) {
      mode.value = ThemeMode.light;
    } else {
      mode.value = ThemeMode.dark;
    }
    Get.changeThemeMode(mode.value);

    _box.write(StorageKeys.darkMode, mode.value == ThemeMode.dark);
  }
}
