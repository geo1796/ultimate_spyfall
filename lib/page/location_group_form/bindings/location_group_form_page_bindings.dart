import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/location_group_form/bindings/location_group_form_controller.dart';

class LocationGroupFormPageBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LocationGroupFormController());
  }
}