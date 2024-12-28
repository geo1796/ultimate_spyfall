import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/player/player_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/player_tile.dart';

class PlayerList extends StatelessWidget {
  const PlayerList({super.key});

  PlayerController get _playerCtrl => Get.find<PlayerController>();

  @override
  Widget build(BuildContext context) {
    final players = _playerCtrl.players;
    return Column(
      children: List.generate(
        players.length,
        (i) => PlayerTile(players[i]),
      ),
    );
  }
}
