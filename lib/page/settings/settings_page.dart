import 'package:flutter/material.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';
import 'package:ultimate_spyfall/page/settings/widget/coop_spies_settings_tile.dart';
import 'package:ultimate_spyfall/page/settings/widget/prank_mode_settings_tile.dart';
import 'package:ultimate_spyfall/page/settings/widget/spy_count_settings_tile.dart';
import 'package:ultimate_spyfall/shared/my_app_bar.dart';
import 'package:ultimate_spyfall/shared/my_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, AppLocal.settings),
      drawer: const MyDrawer(),
      body: const SingleChildScrollView(
          child: Column(children: [
        SizedBox(height: 8),
        SpyCountSettingsTile(),
        Divider(),
        CoopSpiesSettingsTile(),
        Divider(),
        PrankModeSettingsTile(),
        Divider(),
      ])),
    );
  }
}
