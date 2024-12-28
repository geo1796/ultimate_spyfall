import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';

class PrankModeSettingsTile extends StatefulWidget {
  const PrankModeSettingsTile({super.key});

  @override
  State<PrankModeSettingsTile> createState() => _PrankModeSettingsTileState();
}

class _PrankModeSettingsTileState extends State<PrankModeSettingsTile> {
  SettingsController get _settingsCtrl => Get.find<SettingsController>();
  late final FixedExtentScrollController _fixedExtentScrollCtrl;

  @override
  void initState() {
    super.initState();

    _fixedExtentScrollCtrl = FixedExtentScrollController(
        initialItem:
            _prankChances.indexOf(_settingsCtrl.prankModeChance.value));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text(AppLocal.prankMode),
      Obx(() => Switch(
            value: _settingsCtrl.prankMode.value,
            onChanged: (newValue) => _settingsCtrl.prankMode.value = newValue,
          )),
      Obx(() {
        if (_settingsCtrl.prankMode.isFalse) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(AppLocal.prankChances),
            ),
            SizedBox(
              height: 120,
              width: Get.size.width,
              child: ListWheelScrollView.useDelegate(
                controller: _fixedExtentScrollCtrl,
                physics: const FixedExtentScrollPhysics(),
                diameterRatio: 1.5,
                onSelectedItemChanged: (i) =>
                    _settingsCtrl.prankModeChance.value = _prankChances[i],
                itemExtent: 50,
                childDelegate: ListWheelChildBuilderDelegate(
                  builder: (_, i) => Text('${_prankChances[i]} %'),
                  childCount: _prankChances.length,
                ),
              ),
            )
          ],
        );
      }),
    ]);
  }
}

const _prankChances = <int>[
  5,
  10,
  15,
  20,
  25,
  30,
  35,
  40,
  45,
  50,
  55,
  60,
  65,
  70,
  75,
  80,
  85,
  90,
  95,
];
