import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';

class PrankModeSettingsTile extends StatelessWidget {
  const PrankModeSettingsTile({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocal.prankMode),
      Obx(() => Switch(
            value: _settingsCtrl.prankMode.value,
            onChanged: (newValue) => _settingsCtrl.prankMode.value = newValue,
          )),
    ]);
  }
}
