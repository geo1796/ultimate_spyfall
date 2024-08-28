import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/players/bindings/players_page_controller.dart';

class PlayersPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayersPageController());
  }
}
