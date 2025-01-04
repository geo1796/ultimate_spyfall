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
    if (_settingsCtrl.coopSpies.isFalse) {
      return Center(child: Text(AppLocal.spy));
    }

    late final List<Player> spies;

    if (_gameCtrl.isPrank) {
      spies = _gameCtrl.getDummySpiesForPrankMode(player);
    } else {
      spies = _gameCtrl.spies;
    }

    return SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            AppLocal.spies,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        ...List.generate(
            spies.length,
            (i) => Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(spies[i].name),
                ))
      ]),
    );
  }
}
