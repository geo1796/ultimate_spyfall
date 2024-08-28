import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/controller/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationGroupFormController {
  final LocationController _locationsController = Get.find();
  final form = GlobalKey<FormState>();
  final newGroup = LocationGroup('', locations: List.generate(10, (i) => ''));

  List<LocationGroup> get currentGroups => _locationsController.groups;

  Future<void> onSubmit() async {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    await _locationsController.addLocationGroup(newGroup);
    Get.back();
  }
}
