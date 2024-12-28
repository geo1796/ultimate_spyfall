import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';

class GameBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(GameController());
  }
}
