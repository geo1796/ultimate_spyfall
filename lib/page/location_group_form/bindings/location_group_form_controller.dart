import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationGroupFormController {
  final LocationController _locationsController = Get.find();
  final form = GlobalKey<FormState>();
  final newGroup = LocationGroup('', locations: List.generate(10, (i) => ''));

  List<LocationGroup> get currentGroups => _locationsController.groups;

  void onSubmit() {
    if (!form.currentState!.validate()) return;
    form.currentState!.save();
    
    _locationsController.addLocationGroup(newGroup);
    Get.back();
  }
}
