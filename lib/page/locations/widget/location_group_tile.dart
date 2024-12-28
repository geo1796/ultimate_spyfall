import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';
import 'package:ultimate_spyfall/page/location_group_details/location_group_details_page.dart';

class LocationGroupTile extends StatelessWidget {
  const LocationGroupTile(this.locationGroup, {super.key});
  final LocationGroup locationGroup;

  @override
  Widget build(BuildContext context) {
    final LocationController locationsController = Get.find();
    return Card(
      elevation: 6,
      child: ListTile(
        leading: IconButton(
          onPressed: () => locationsController.selectLocationGroup(locationGroup),
          icon: Obx(() => Icon(
              locationsController.selectedGroup.value.name == locationGroup.name
                  ? Icons.star
                  : Icons.star_border)),
        ),
        title: Text(locationGroup.name),
        trailing: IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () => Get.toNamed(LocationGroupDetailsPage.route,
              arguments: locationGroup),
        ),
      ),
    );
  }
}
