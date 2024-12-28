import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/model/player.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/player_check_bottom_sheet.dart';

class PlayerTile extends StatelessWidget {
  const PlayerTile(this.player, {super.key});
  final Player player;

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListTile(
        leading: const Icon(Icons.person),
        title: Text(player.name),
        trailing: _traling,
      ),
    );
  }

  Widget? get _traling {
    if (_gameCtrl.playerChecks[player]!.isTrue) return null;

    return ElevatedButton(
      onPressed: () {
        _gameCtrl.playerChecks[player]!.value = true;
        showModalBottomSheet(
            context: Get.context!, builder: (_) => PlayerCheckBottomSheet(player));
      },
      child: const Text('Check'),
    );
  }
}
