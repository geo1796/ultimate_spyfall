import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/location_controller.dart';
import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const route = '/';

  @override
  Widget build(BuildContext context) {
    final LocationController locationsController = Get.find();
    if (!locationsController.setupCompleted) {
      locationsController
          .setupDefaultLocations(Get.deviceLocale?.languageCode ?? '');
    }
    return Scaffold(
      appBar: myAppBar(context, 'Ultimate Spyfall'),
      drawer: const MyDrawer(),
      body: const Placeholder(),
    );
  }
}
