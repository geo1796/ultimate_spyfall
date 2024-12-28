import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/controller/settings_controller.dart';

class FixedSpiesSettings extends StatelessWidget {
  const FixedSpiesSettings({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: _settingsCtrl.decreaseFixedSpyCount,
          icon: const Icon(Icons.remove),
        ),
        Center(child: Obx(() => Text('${_settingsCtrl.fixedSpyCount.value}'))),
        IconButton(
          onPressed: _settingsCtrl.increaseFixedSpyCount,
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
