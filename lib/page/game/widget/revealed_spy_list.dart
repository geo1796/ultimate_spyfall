import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';

class RevealedSpyList extends StatelessWidget {
  const RevealedSpyList({super.key});

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    if (_gameCtrl.isPrank) {
      return Image.asset('assets/prank.jpeg');
    }

    final spies = _gameCtrl.spies;
    return ListView.builder(
      itemCount: spies.length,
      itemBuilder: (_, i) => Padding(
        padding: const EdgeInsets.all(4.0),
        child: Center(child: Text(spies[i].name)),
      ),
    );
  }
}
