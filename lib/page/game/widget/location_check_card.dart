import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';

class LocationCheckCard extends StatelessWidget {
  const LocationCheckCard(this.location, {super.key});
  final String location;

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      late final Color? cardColor;
      late final Color? textColor;

      if (_gameCtrl.locationChecks[location]!.isFalse) {
        cardColor = null;
        textColor = null;
      } else if (_gameCtrl.location == location) {
        cardColor = Colors.green;
        textColor = Colors.white;
      } else {
        cardColor = Colors.red;
        textColor = Colors.white;
      }

      return GestureDetector(
        onTap: () => _gameCtrl.locationChecks[location]!.value = true,
        child: Card(
          color: cardColor,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              location,
              style: TextStyle(
                color: textColor,
                decoration: _gameCtrl.previousLocation == location
                    ? TextDecoration.lineThrough
                    : null,
                decorationColor: textColor,
                decorationThickness: 2,
              ),
            ),
          ),
        ),
      );
    });
  }
}
