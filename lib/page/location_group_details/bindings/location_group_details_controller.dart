import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationGroupDetailsController extends GetxController {
  final _locationCtrl = Get.find<LocationController>();
  final form = GlobalKey<FormState>();

  late final Rx<LocationGroup> group;

  var locationData = '';
  var groupData = '';

  LocationGroupDetailsController(LocationGroup group) {
    this.group = group.obs;
  }

  void renameGroup() {
    if (!form.currentState!.validate()) return;
    form.currentState!.save();

    final editedGroup =
        LocationGroup(groupData, locations: group.value.locations);

    _locationCtrl.editLocationGroup(group.value.name, editedGroup);

    group.value = editedGroup;

    Get.back();
  }

  void addLocation() {
    if (!form.currentState!.validate()) return;
    form.currentState!.save();

    final editedGroup = LocationGroup(group.value.name,
        locations: List.of([...group.value.locations, locationData]));

    _locationCtrl.editLocationGroup(group.value.name, editedGroup);

    group.value = editedGroup;

    Get.back();
  }

  void editLocation(String location) {
    if (!form.currentState!.validate()) return;
    form.currentState!.save();

    final editedGroup = LocationGroup.copy(group.value);

    final index = editedGroup.locations.indexWhere((l) => l == location);

    editedGroup.locations[index] = locationData;

    _locationCtrl.editLocationGroup(group.value.name, editedGroup);

    Get.back();
  }
}
