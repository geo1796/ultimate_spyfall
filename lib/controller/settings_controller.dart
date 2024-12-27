import 'dart:async';

import 'package:get/get.dart';
import 'package:ultimate_spyfall/controller/player_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';
import 'package:ultimate_spyfall/service/settings_service.dart';

class SettingsController extends GetxController {
  final _playerCtrl = Get.find<PlayerController>();
  final _settingsService = Get.find<SettingsService>();

  late final RxInt spyCount;
  late final RxBool prankMode;
  late final RxBool coopSpies;
  late final StreamSubscription<List<Player>> _playersSub;

  @override
  void onInit() {
    super.onInit();

    spyCount = _settingsService.spyCount.obs;
    prankMode = _settingsService.prankMode.obs;
    coopSpies = _settingsService.coopSpies.obs;

    _playersSub = _playerCtrl.players.listen((players) {
      if (spyCount.value < _playerCtrl.players.length) return;

      decreaseSpyCount();
    });
  }

  @override
  void onClose() {
    _playersSub.cancel();
    super.onClose();
  }

  void decreaseSpyCount() {
    if (spyCount.value == 1) return;

    spyCount.value--;
    _settingsService.spyCount = spyCount.value;
  }

  void increaseSpyCount() {
    if (spyCount.value + 1 == _playerCtrl.players.length) return;

    spyCount.value++;
    _settingsService.spyCount = spyCount.value;
  }
}
