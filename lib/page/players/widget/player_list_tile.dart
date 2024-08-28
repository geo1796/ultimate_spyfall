import 'package:flutter/material.dart';

import '../../../model/player.dart';
import 'edit_player_dialog.dart';

class PlayerListTile extends StatelessWidget {
  const PlayerListTile(this.player, {super.key});
  final Player player;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(player.name),
        trailing: IconButton(
          onPressed: () => _onEditPlayer(context),
          icon: const Icon(Icons.edit),
        ),
      ),
    );
  }

  Future<void> _onEditPlayer(BuildContext ctx) async {
    await showDialog(
        context: ctx, builder: (_) => EditPlayerDialog(player: player));
  }
}
