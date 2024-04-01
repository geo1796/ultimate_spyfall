import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../controller/player_controller.dart';
import 'dismissible_player_list_tile.dart';
import 'player_list_tile.dart';

class PlayersList extends StatelessWidget {
  const PlayersList({super.key});

  @override
  Widget build(BuildContext context) {
    final PlayerController playerController = Get.find();
    final players = playerController.players;
    return Obx(() => ListView(
          children: [
            ...List.generate(
              players.length,
              players.length > 3
                  ? (i) => DismissiblePlayerListTile(players[i])
                  : (i) => PlayerListTile(players[i]),
            ),
            if (players.length > 3) const SizedBox(height: 100.0)
          ],
        ));
  }
}
