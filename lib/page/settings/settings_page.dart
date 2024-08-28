import 'package:flutter/material.dart';
import 'package:ultimate_spyfall/app_local/app_local.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const route = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, AppLocal.settings),
      drawer: const MyDrawer(),
      body: const Placeholder(),
    );
  }
}
