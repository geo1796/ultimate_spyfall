import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/locations_controller.dart';
import 'location_group_list_tile.dart';

class LocationGroupsListView extends StatelessWidget {
  const LocationGroupsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationsController locationsController = Get.find();
    final locationGroups = locationsController.locationGroups;
    return Obx(() => ListView.builder(
        itemCount: locationGroups.length,
        itemBuilder: (_, i) => LocationGroupListTile(locationGroups[i])));
  }
}
