import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';

class PlayerCheckBottomSheet extends StatelessWidget {
  const PlayerCheckBottomSheet(this.player, {super.key});
  final Player player;

  GameController get _gameCtrl => Get.find<GameController>();
  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(children: [
        if (_gameCtrl.isSpy(player)) _spyWidget else _locationWidget
      ]),
    );
  }

  Widget get _locationWidget => Center(child: Text(_gameCtrl.location));

  Widget get _spyWidget {
    if (_settingsCtrl.coopSpies.isTrue) {
      late final List<Player> spies;

      if (_settingsCtrl.prankMode.isTrue) {
        spies = _gameCtrl.getDummySpiesForPrankMode(player);
      } else {
        spies = _gameCtrl.spies;
      }

      return Column(
          children: List.generate(spies.length, (i) => Text(spies[i].name)));
    }

    return Center(child: Text(AppLocal.spy));
  }
}
