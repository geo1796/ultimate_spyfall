import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bindings/location/location_controller.dart';
import 'location_group_tile.dart';

class LocationGroupList extends StatelessWidget {
  const LocationGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationsController = Get.find();
    final locationGroups = locationsController.groups;
    return Obx(() => ListView.builder(
        itemCount: locationGroups.length,
        itemBuilder: (_, i) => LocationGroupTile(locationGroups[i])));
  }
}
