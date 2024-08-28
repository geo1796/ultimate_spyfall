import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/location_group_details/bindings/location_group_details_controller.dart';

class LocationGroupDetailsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(LocationGroupDetailsController());
  }
}
