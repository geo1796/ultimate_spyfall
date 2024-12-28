import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';

class RandomSpiesSettings extends StatelessWidget {
  const RandomSpiesSettings({super.key});

  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Column(children: [
        const Text('Min'),
        Row(children: [
          IconButton(
            onPressed: _settingsCtrl.decreaseMinSpyCount,
            icon: const Icon(Icons.remove),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(() => Text('${_settingsCtrl.minSpyCount.value}')),
          ),
          IconButton(
            onPressed: _settingsCtrl.increaseMinSpyCount,
            icon: const Icon(Icons.add),
          ),
        ]),
      ]),
      Column(
        children: [
          const Text('Max'),
          Row(children: [
            IconButton(
              onPressed: _settingsCtrl.decreaseMaxSpyCount,
              icon: const Icon(Icons.remove),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Obx(() => Text('${_settingsCtrl.maxSpyCount.value}')),
            ),
            IconButton(
              onPressed: _settingsCtrl.increaseMaxSpyCount,
              icon: const Icon(Icons.add),
            ),
          ]),
        ],
      )
    ]);
  }
}
