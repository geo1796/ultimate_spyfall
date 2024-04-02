import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controller/player_controller.dart';
import '../service/player_service.dart';
import 'controller/locations_controller.dart';
import 'controller/theme_controller.dart';
import 'page/home/home_page.dart';
import 'page/location_group_details/location_group_details_page.dart';
import 'page/location_group_form/location_group_form_page.dart';
import 'page/locations/locations_page.dart';
import 'page/players/players_page.dart';
import 'page/settings/settings_page.dart';
import 'service/locations_service.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  Get.put(LocationsService());
  Get.put(LocationsController());
  Get.put(PlayerService());
  Get.put(PlayerController());
  Get.put(ThemeController());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blueGrey;

    const appBarTheme =
        AppBarTheme(color: primaryColor, foregroundColor: Colors.white);
    const listTileTheme = ListTileThemeData(
      iconColor: primaryColor,
      textColor: primaryColor,
    );

    final lightTheme = ThemeData(
      colorScheme: const ColorScheme.light(primary: primaryColor),
      useMaterial3: true,
      appBarTheme: appBarTheme,
      listTileTheme: listTileTheme,
      dividerTheme: const DividerThemeData(color: primaryColor),
      iconTheme: const IconThemeData(color: primaryColor),
    );

    final darkTheme = ThemeData(
      colorScheme: const ColorScheme.dark(primary: primaryColor),
      useMaterial3: true,
      appBarTheme: appBarTheme,
    );

    final ThemeController themeController = Get.find();

    return Obx(() => GetMaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          title: 'Ultimate Spyfall',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: themeController.themeMode,
          getPages: [
            GetPage(name: HomePage.route, page: () => const HomePage()),
            GetPage(name: SettingsPage.route, page: () => const SettingsPage()),
            GetPage(name: PlayersPage.route, page: () => const PlayersPage()),
            GetPage(
                name: LocationsPage.route, page: () => const LocationsPage()),
            GetPage(
                name: LocationGroupFormPage.route,
                page: () => const LocationGroupFormPage()),
            GetPage(
                name: LocationGroupDetailsPage.route,
                page: () => const LocationGroupDetailsPage()),
          ],
        ));
  }
}
