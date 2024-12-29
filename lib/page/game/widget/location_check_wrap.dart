import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/location_check_card.dart';

class LocationCheckWrap extends StatelessWidget {
  const LocationCheckWrap({super.key});

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    final locations = _gameCtrl.locationChecks.keys.toList();
    return SingleChildScrollView(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: List.generate(
          locations.length,
          (i) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: LocationCheckCard(locations[i]),
          ),
        ),
      ),
    );
  }
}
