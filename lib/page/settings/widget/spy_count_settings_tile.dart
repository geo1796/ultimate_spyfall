import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';
import 'package:ultimate_spyfall/page/settings/widget/fixed_spies_settings.dart';
import 'package:ultimate_spyfall/page/settings/widget/random_spies_settings.dart';

class SpyCountSettingsTile extends StatelessWidget {
  const SpyCountSettingsTile({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(() {
          if (_settingsCtrl.randomSpies.isTrue) {
            return Text(AppLocale.randomSpies);
          }

          return Text(AppLocale.fixedSpies);
        }),
        Obx(() => Switch(
              value: _settingsCtrl.randomSpies.value,
              onChanged: (newValue) =>
                  _settingsCtrl.randomSpies.value = newValue,
            )),
        Obx(() {
          if (_settingsCtrl.randomSpies.isTrue) {
            return const RandomSpiesSettings();
          }

          return const FixedSpiesSettings();
        }),
      ],
    );
  }
}
