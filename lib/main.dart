import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/app_local/translations/my_translations.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_page_bindings.dart';
import 'package:ultimate_spyfall/page/location_group_form/bindings/location_group_form_page_bindings.dart';
import 'package:ultimate_spyfall/page/players/bindings/players_page_bindings.dart';

import '../controller/player_controller.dart';
import '../service/player_service.dart';
import 'controller/location_controller.dart';
import 'controller/theme_controller.dart';
import 'page/home/home_page.dart';
import 'page/location_group_details/location_group_details_page.dart';
import 'page/location_group_form/location_group_form_page.dart';
import 'page/locations/locations_page.dart';
import 'page/players/players_page.dart';
import 'page/settings/settings_page.dart';
import 'service/locations_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await GetStorage.init();

  Get.put(LocationsService());
  Get.put(LocationController());
  Get.put(PlayerService());
  Get.put(PlayerController());
  Get.put(ThemeController());

  runApp(const MyApp());
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
          themeMode: themeController.themeMode,
          getPages: [
            GetPage(name: HomePage.route, page: () => const HomePage()),
            GetPage(name: SettingsPage.route, page: () => const SettingsPage()),
            GetPage(
              name: PlayersPage.route,
              page: () => const PlayersPage(),
              binding: PlayersPageBindings(),
            ),
            GetPage(
                name: LocationsPage.route, page: () => const LocationsPage()),
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
          ],
        ));
  }
}
