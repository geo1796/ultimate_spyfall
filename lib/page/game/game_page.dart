import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/location_check_wrap.dart';
import 'package:ultimate_spyfall/page/game/widget/player_list.dart';
import 'package:ultimate_spyfall/page/game/widget/revealed_spy_list_bottom_sheet.dart';
import 'package:ultimate_spyfall/shared/my_app_bar.dart';
import 'package:ultimate_spyfall/shared/my_drawer.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  static const route = '/game';

  GameController get _gameCtrl => Get.find<GameController>();
  SettingsController get _settingsCtrl => Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, 'Ultimate Spyfall'),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
            child: Column(children: [
          const PlayerList(),
          const SizedBox(height: 16),
          Builder(builder: (_) {
            String text = '${AppLocal.coopSpies}: ';

            if (_settingsCtrl.coopSpies.isTrue) {
              text += AppLocal.yes;
            } else {
              text += AppLocal.no;
            }

            return Text(text,
                style: const TextStyle(fontWeight: FontWeight.bold));
          }),
          const SizedBox(height: 8),
          Builder(builder: (_) {
            String text = '${AppLocal.spyCount}: ';

            if (_settingsCtrl.randomSpies.isTrue) {
              text +=
                  '${_settingsCtrl.minSpyCount.value} .. ${_settingsCtrl.maxSpyCount.value}';
            } else {
              text += '${_settingsCtrl.fixedSpyCount.value}';
            }

            return Text(text,
                style: const TextStyle(fontWeight: FontWeight.bold));
          }),
          const SizedBox(height: 16),
          Obx(() {
            if (_gameCtrl.spiesRevealed.isTrue) {
              return const SizedBox.shrink();
            }
            return ElevatedButton(
              onPressed: () {
                _gameCtrl.spiesRevealed.value = true;
                showModalBottomSheet(
                    context: context,
                    builder: (_) => const RevealedSpyListBottomSheet());
              },
              child: Text(AppLocal.revealSpies),
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => showModalBottomSheet(
                context: context, builder: (_) => const LocationCheckWrap()),
            child: Text(AppLocal.showLocations),
          ),
          const SizedBox(height: 64),
          ElevatedButton(
              onPressed: () => Get.offAllNamed(route),
              child: Text(AppLocal.restart)),
        ])));
  }
}
