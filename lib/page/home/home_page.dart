import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../../controller/locations_controller.dart';
import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final appLocal = AppLocalizations.of(context)!;
    final LocationsController locationsController = Get.find();
    if (!locationsController.setupCompleted) {
      locationsController.setupDefaultLocations(appLocal.localeName);
    }
    return Scaffold(
      appBar: myAppBar(context, 'Ultimate Spyfall'),
      drawer: const MyDrawer(),
      body: const Placeholder(),
    );
  }
}
