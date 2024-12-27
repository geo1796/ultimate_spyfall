import 'package:flutter/material.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';
import 'widget/edit_player_dialog.dart';
import 'widget/players_list_view.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});
  static const route = '/players';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showDialog(
            context: context, builder: (_) => const EditPlayerDialog()),
        child: const Icon(Icons.add),
      ),
      appBar: myAppBar(context, AppLocal.players),
      drawer: const MyDrawer(),
      body: const PlayersList(),
    );
  }
}
