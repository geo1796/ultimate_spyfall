import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';
import 'package:ultimate_spyfall/page/location_group_details/widget/edit_group_name_dialog.dart';
import 'package:ultimate_spyfall/shared/theme_switch.dart';

import 'widget/edit_location_dialog.dart';
import 'widget/location_list_view.dart';

class LocationGroupDetailsPage extends StatelessWidget {
  const LocationGroupDetailsPage({super.key});
  static const route = '/location-group-details';

  LocationGroupDetailsController get _detailsCtrl =>
      Get.find<LocationGroupDetailsController>();

  @override
  Widget build(BuildContext context) {
    final locationGroup = _detailsCtrl.group;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showDialog(
            context: context, builder: (_) => const EditLocationDialog()),
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Row(children: [
          Obx(() => Text(locationGroup.value.name)),
          IconButton(
              onPressed: () => Get.dialog(const EditGroupNameDialog()),
              icon: const Icon(Icons.edit)),
        ]),
        actions: const [ThemeSwitch()],
      ),
      body: const LocationListView(),
    );
  }
}
