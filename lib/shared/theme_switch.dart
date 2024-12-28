import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/theme/theme_controller.dart';

class ThemeSwitch extends StatelessWidget {
  const ThemeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return IconButton(
        onPressed: themeController.toggleTheme,
        icon: Obx(() =>
            Icon(themeController.isDark ? Icons.light_mode : Icons.dark_mode)));
  }
}
