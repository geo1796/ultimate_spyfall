import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../bindings/location/location_controller.dart';
import '../../../model/location_group.dart';
import 'location_list.dart';

class DismissibleLocationListTile extends StatelessWidget {
  const DismissibleLocationListTile({
    super.key,
    required this.locationGroup,
    required this.location,
  });
  final LocationGroup locationGroup;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
        key: ValueKey(location),
        direction: DismissDirection.endToStart,
        background: Container(
          padding: const EdgeInsets.only(right: 16.0),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        onDismissed: (_) async {
          final LocationController locationsController = Get.find();
          final editedGroup = LocationGroup(locationGroup.name, locations: [
            ...locationGroup.locations.where((l) => l != location)
          ]);
          await locationsController.editLocationGroup(
              locationGroup.name, editedGroup);
        },
        child: LocationTile(
          location: location,
          locationGroup: locationGroup,
        ));
  }
}
