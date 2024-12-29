import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/location_check_wrap.dart';
import 'package:ultimate_spyfall/page/game/widget/player_list.dart';
import 'package:ultimate_spyfall/page/game/widget/revealed_spy_list.dart';
import 'package:ultimate_spyfall/shared/my_app_bar.dart';
import 'package:ultimate_spyfall/shared/my_drawer.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  static const route = '/game';

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar(context, 'Ultimate Spyfall'),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
            child: Column(children: [
          const PlayerList(),
          const SizedBox(height: 16),
          Obx(() {
            if (_gameCtrl.spiesRevealed.isTrue) {
              return const SizedBox.shrink();
            }
            return ElevatedButton(
              onPressed: () {
                _gameCtrl.spiesRevealed.value = true;
                showModalBottomSheet(
                    context: context, builder: (_) => const RevealedSpyList());
              },
              child: Text(AppLocal.revealSpies),
            );
          }),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => showModalBottomSheet(
                context: context, builder: (_) => const LocationCheckWrap()),
            child: Text(AppLocal.seeLocations),
          ),
          const SizedBox(height: 64),
          ElevatedButton(
              onPressed: () => Get.offAllNamed(route),
              child: Text(AppLocal.restart)),
        ])));
  }
}
