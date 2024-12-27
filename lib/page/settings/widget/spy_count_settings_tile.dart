import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/controller/settings_controller.dart';

class SpyCountSettingsTile extends StatelessWidget {
  const SpyCountSettingsTile({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(AppLocal.spyCount),
        ListTile(
          leading: IconButton(
              onPressed: _settingsCtrl.decreaseSpyCount,
              icon: const Icon(Icons.remove)),
          title:
              Center(child: Obx(() => Text('${_settingsCtrl.spyCount.value}'))),
          trailing: IconButton(
              onPressed: _settingsCtrl.increaseSpyCount,
              icon: const Icon(Icons.add)),
        ),
      ],
    );
  }
}
