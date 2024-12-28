import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationGroupDetailsController extends GetxController {
  final _locationsController = Get.find<LocationController>();
  final form = GlobalKey<FormState>();

  late final LocationGroup group;

  var data = '';

  @override
  void onInit() {
    super.onInit();
    group = Get.arguments as LocationGroup;
  }

  Future<void> addLocation() async {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    final editedGroup = LocationGroup(group.name,
        locations: List.of([...group.locations, data]));
    await _locationsController.editLocationGroup(group.name, editedGroup);
    Get.back();
  }

  Future<void> editLocation(String location) async {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    final editedGroup = LocationGroup.copy(group);
    final index = editedGroup.locations.indexWhere((l) => l == location);
    editedGroup.locations[index] = data;
    await _locationsController.editLocationGroup(group.name, editedGroup);
    Get.back();
  }
}
