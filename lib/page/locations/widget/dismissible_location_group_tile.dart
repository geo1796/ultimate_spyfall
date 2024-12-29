import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';
import 'package:ultimate_spyfall/page/locations/widget/location_group_tile.dart';

class DismissibleLocationGroupTile extends StatelessWidget {
  const DismissibleLocationGroupTile(this.locationGroup, {super.key});
  final LocationGroup locationGroup;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(locationGroup),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(right: 16.0),
        alignment: Alignment.centerRight,
        child: const Icon(Icons.delete),
      ),
      onDismissed: (_) async {
        final locationCtrl = Get.find<LocationController>();
        locationCtrl.deleteLocationGroup(locationGroup);
      },
      child: LocationGroupTile(locationGroup),
    );
  }
}
