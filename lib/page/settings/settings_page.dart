import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  static const route = '/settings';

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: myAppBar(context, appLocal.settings),
      drawer: const MyDrawer(),
      body: const Placeholder(),
    );
  }
}
