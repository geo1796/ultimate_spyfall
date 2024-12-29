import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/locations/widget/dismissible_location_group_tile.dart';

import '../../../bindings/location/location_controller.dart';

class LocationGroupList extends StatelessWidget {
  const LocationGroupList({super.key});

  @override
  Widget build(BuildContext context) {
    final LocationController locationsController = Get.find();
    final locationGroups = locationsController.groups;
    return Obx(() => ListView.builder(
        itemCount: locationGroups.length,
        itemBuilder: (_, i) => DismissibleLocationGroupTile(locationGroups[i])));
  }
}
