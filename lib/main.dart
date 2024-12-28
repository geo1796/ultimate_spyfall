import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/app_local/translations/my_translations.dart';
import 'package:ultimate_spyfall/bindings/misc/random_int_generator.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_bindings.dart';
import 'package:ultimate_spyfall/page/game/game_page.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_page_bindings.dart';
import 'package:ultimate_spyfall/page/location_group_form/bindings/location_group_form_page_bindings.dart';
import 'package:ultimate_spyfall/page/players/bindings/players_page_bindings.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_service.dart';
import 'package:ultimate_spyfall/theme.dart';

import 'bindings/player/player_controller.dart';
import 'bindings/player/player_service.dart';
import 'bindings/location/location_controller.dart';
import 'bindings/theme/theme_controller.dart';
import 'page/home/home_page.dart';
import 'page/location_group_details/location_group_details_page.dart';
import 'page/location_group_form/location_group_form_page.dart';
import 'page/locations/locations_page.dart';
import 'page/players/players_page.dart';
import 'page/settings/settings_page.dart';
import 'bindings/location/location_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init();
  Get.put(GetStorage());

  Get.put(LocationService());
  Get.put(LocationController());

  Get.put(PlayerService());
  Get.put(PlayerController());

  Get.put(SettingsService());
  Get.put(SettingsController());

  Get.put(ThemeController());

  Get.put(RandomIntGenerator());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();

    return GetMaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      translationsKeys: MyTranslations().keys,
      title: 'Ultimate Spyfall',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeController.mode.value,
      getPages: [
        GetPage(name: HomePage.route, page: () => const HomePage()),
        GetPage(name: SettingsPage.route, page: () => const SettingsPage()),
        GetPage(
          name: PlayersPage.route,
          page: () => const PlayersPage(),
          binding: PlayersPageBindings(),
        ),
        GetPage(name: LocationsPage.route, page: () => const LocationsPage()),
        GetPage(
          name: LocationGroupFormPage.route,
          page: () => const LocationGroupFormPage(),
          binding: LocationGroupFormPageBindings(),
        ),
        GetPage(
          name: LocationGroupDetailsPage.route,
          page: () => const LocationGroupDetailsPage(),
          binding: LocationGroupDetailsPageBindings(),
        ),
        GetPage(
          name: GamePage.route,
          page: () => const GamePage(),
          binding: GameBindings(),
        ),
      ],
    );
  }
}
