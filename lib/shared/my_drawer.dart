import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/shared/play_button.dart';

import '../page/home/home_page.dart';
import '../page/locations/locations_page.dart';
import '../page/players/players_page.dart';
import '../page/settings/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        AppBar(
          title: const Text('Navigation'),
          leading: Builder(
              builder: (ctx) => IconButton(
                    onPressed: () => Scaffold.of(ctx).closeDrawer(),
                    icon: const Icon(Icons.menu),
                    tooltip: '',
                  )),
        ),
        ListTile(
          leading: const Icon(Icons.home),
          title: Text(AppLocal.home),
          onTap: () => Get.offAllNamed(HomePage.route),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.person_add),
          title: Text(AppLocal.players),
          onTap: () => Get.offAllNamed(PlayersPage.route),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.place),
          title: Text(AppLocal.locations),
          onTap: () => Get.offAllNamed(LocationsPage.route),
        ),
        const Divider(),
        ListTile(
          leading: const Icon(Icons.settings),
          title: Text(AppLocal.settings),
          onTap: () => Get.offAllNamed(SettingsPage.route),
        ),
        const Divider(),
        const Spacer(),
        const PlayButton(),
        const Spacer(),
      ]),
    );
  }
}
