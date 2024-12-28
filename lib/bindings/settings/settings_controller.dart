import 'dart:async';

import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/player/player_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_service.dart';

class SettingsController extends GetxController {
  final _playerCtrl = Get.find<PlayerController>();
  final _settingsService = Get.find<SettingsService>();

  late final RxInt fixedSpyCount;
  late final RxBool prankMode;
  late final RxBool coopSpies;
  late final RxBool randomSpies;
  late final RxInt maxSpyCount;
  late final RxInt minSpyCount;
  late final StreamSubscription<List<Player>> _playersSub;

  @override
  void onInit() {
    super.onInit();

    fixedSpyCount = _settingsService.fixedSpyCount.obs;
    prankMode = _settingsService.prankMode.obs;
    coopSpies = _settingsService.coopSpies.obs;
    randomSpies = _settingsService.randomSpies.obs;
    maxSpyCount = _settingsService.maxSpyCount.obs;
    minSpyCount = _settingsService.minSpyCount.obs;

    _playersSub = _playerCtrl.players.listen((players) {
      if (fixedSpyCount.value == players.length) {
        decreaseFixedSpyCount();
      }

      if (maxSpyCount.value == players.length) {
        decreaseMaxSpyCount();
      }
    });
  }

  @override
  void onClose() {
    _playersSub.cancel();
    super.onClose();
  }

  void decreaseFixedSpyCount() {
    if (fixedSpyCount.value == 1) return;

    fixedSpyCount.value--;
    _settingsService.fixedSpyCount = fixedSpyCount.value;
  }

  void increaseFixedSpyCount() {
    if (fixedSpyCount.value + 1 == _playerCtrl.players.length) return;

    fixedSpyCount.value++;
    _settingsService.fixedSpyCount = fixedSpyCount.value;
  }

  void decreaseMinSpyCount() {
    if (minSpyCount.value == 0) return;

    minSpyCount.value--;
    _settingsService.minSpyCount = minSpyCount.value;
  }

  void increaseMinSpyCount() {
    if (minSpyCount.value + 1 == maxSpyCount.value) {
      if (maxSpyCount.value + 1 == _playerCtrl.players.length) return;
      increaseMaxSpyCount();
    }

    minSpyCount.value++;
    _settingsService.minSpyCount = minSpyCount.value;
  }

  void decreaseMaxSpyCount() {
    if (maxSpyCount.value - 1 == minSpyCount.value) {
      if (minSpyCount.value == 0) return;
      decreaseMinSpyCount();
    }

    maxSpyCount.value--;
    _settingsService.maxSpyCount = maxSpyCount.value;
  }

  void increaseMaxSpyCount() {
    if (maxSpyCount.value + 1 == _playerCtrl.players.length) return;

    maxSpyCount.value++;
    _settingsService.maxSpyCount = maxSpyCount.value;
  }
}
