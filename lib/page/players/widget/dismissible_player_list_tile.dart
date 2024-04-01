import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/player_controller.dart';
import '../../../model/player.dart';
import 'player_list_tile.dart';

class DismissiblePlayerListTile extends StatelessWidget {
  const DismissiblePlayerListTile(this.player, {super.key});
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(player),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 16.0),
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.delete,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onDismissed: (_) async {
        final PlayerController playerController = Get.find();
        await playerController.removePlayer(player);
      },
      child: PlayerListTile(player),
    );
  }
}
