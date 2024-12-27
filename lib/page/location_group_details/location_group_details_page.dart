import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/location_group.dart';
import '../../shared/my_app_bar.dart';
import 'widget/edit_location_dialog.dart';
import 'widget/location_list_view.dart';

class LocationGroupDetailsPage extends StatelessWidget {
  const LocationGroupDetailsPage({super.key});
  static const route = '/location-group-details';
  @override
  Widget build(BuildContext context) {
    final locationGroup = Get.arguments as LocationGroup;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async => await showDialog(
            context: context, builder: (_) => const EditLocationDialog()),
        child: const Icon(Icons.add),
      ),
      appBar: myAppBar(context, locationGroup.name, withDrawer: false),
      body: LocationListView(locationGroup.name),
    );
  }
}
