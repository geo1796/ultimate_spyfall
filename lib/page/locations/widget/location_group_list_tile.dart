import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/locations_controller.dart';
import '../../../model/location_group.dart';

class LocationGroupListTile extends StatelessWidget {
  const LocationGroupListTile(this.locationGroup, {super.key});
  final LocationGroup locationGroup;

  @override
  Widget build(BuildContext context) {
    final LocationsController locationsController = Get.find();
    return Card(
      elevation: 6,
      child: ListTile(
        leading: IconButton(
          onPressed: () => locationsController.setCurrent(locationGroup),
          icon: Obx(() => Icon(
              locationsController.currentGroup.value!.name == locationGroup.name
                  ? Icons.star
                  : Icons.star_border)),
        ),
        title: Text(locationGroup.name),
      ),
    );
  }
}
