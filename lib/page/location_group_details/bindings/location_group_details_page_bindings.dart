import 'package:get/get.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';

class LocationGroupDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    final groupName = Get.arguments as String;
    final locationCtrl = Get.find<LocationController>();

    Get.put(LocationGroupDetailsController(locationCtrl.getGroupByName(groupName)));
  }
}
