import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';

import 'dismissible_location_list_tile.dart';
import 'location_tile.dart';

class LocationListView extends StatelessWidget {
  const LocationListView({super.key});

  LocationGroupDetailsController get _detailsCtrl =>
      Get.find<LocationGroupDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final locationGroup = _detailsCtrl.group.value;
      
      return ListView(
        children: [
          ...List.generate(
              locationGroup.locations.length,
              locationGroup.locations.length > 10
                  ? (i) => DismissibleLocationListTile(
                        locationGroup: locationGroup,
                        location: locationGroup.locations[i],
                      )
                  : (i) => LocationTile(
                        locationGroup: locationGroup,
                        location: locationGroup.locations[i],
                      )),
          const SizedBox(height: 100.0),
        ],
      );
    });
  }
}
