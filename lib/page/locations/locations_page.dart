import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/app_locale/app_locale.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/page/locations/widget/dismissible_location_group_tile.dart';

import '../../shared/my_app_bar.dart';
import '../../shared/my_drawer.dart';
import '../location_group_form/location_group_form_page.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  static const route = '/locations';

  LocationController get locationCtrl => Get.find<LocationController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(LocationGroupFormPage.route),
        child: const Icon(Icons.add),
      ),
      appBar: myAppBar(context, AppLocale.locations),
      drawer: const MyDrawer(),
      body: Obx(() {
        final groups = locationCtrl.groups;
        return ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await locationCtrl.importLocations();
                      } catch (e) {
                        if (kDebugMode) {
                          debugPrint(
                              'error during locations import: ${e.toString()}');
                        }
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(AppLocale.anErrorOccurred)));
                        }
                      }
                    },
                    child: Text(AppLocale.import),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    try {
                      await locationCtrl.exportLocations();
                    } catch (e) {
                      if (kDebugMode) {
                        debugPrint(
                            'error during locations export: ${e.toString()}');
                      }
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(AppLocale.anErrorOccurred)));
                      }
                    }
                  },
                  child: Text(AppLocale.export),
                ),
              ],
            ),
            ...List.generate(
              groups.length,
              (i) => DismissibleLocationGroupTile(groups[i]),
            ),
          ],
        );
      }),
    );
  }
}
