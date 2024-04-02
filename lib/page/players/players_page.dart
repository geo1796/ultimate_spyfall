import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';
import 'widget/edit_player_dialog.dart';
import 'widget/players_list_view.dart';

class PlayersPage extends StatelessWidget {
  const PlayersPage({super.key});
  static const route = '/players';

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showDialog(
            context: context, builder: (_) => const EditPlayerDialog(null)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: myAppBar(context, appLocal.players),
      drawer: const MyDrawer(),
      body: const PlayersList(),
    );
  }
}
