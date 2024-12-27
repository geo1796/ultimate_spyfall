import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/controller/settings_controller.dart';

class CoopSpiesSettingsTile extends StatelessWidget {
  const CoopSpiesSettingsTile({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocal.coopSpies),
      Obx(() => Switch(
            value: _settingsCtrl.coopSpies.value,
            onChanged: (newValue) => _settingsCtrl.coopSpies.value = newValue,
          )),
    ]);
  }
}
