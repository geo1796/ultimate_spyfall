import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/locations_controller.dart';
import 'dismissible_location_list_tile.dart';
import 'location_list_tile.dart';

class LocationListView extends StatelessWidget {
  const LocationListView(this.groupName, {super.key});
  final String groupName;

  @override
  Widget build(BuildContext context) {
    final LocationsController locationsController = Get.find();
    return Obx(() {
      final locationGroup = locationsController.locationGroups
          .firstWhere((lg) => lg.name == groupName);
      return ListView(
        children: [
          ...List.generate(
              locationGroup.locations.length,
              locationGroup.locations.length > 10
                  ? (i) => DismissibleLocationListTile(
                        locationGroup: locationGroup,
                        location: locationGroup.locations[i],
                      )
                  : (i) => LocationListTile(
                        locationGroup: locationGroup,
                        location: locationGroup.locations[i],
                      )),
          const SizedBox(height: 100.0),
        ],
      );
    });
  }
}
