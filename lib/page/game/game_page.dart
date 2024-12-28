import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/shared/my_app_bar.dart';
import 'package:ultimate_spyfall/shared/my_drawer.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});
  static const route = '/game';

  GameController get _gameCtrl => Get.find<GameController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context, 'Ultimate Spyfall'),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
          child: Column(
              children: List.generate(_gameCtrl.spies.length,
                  (i) => Text(_gameCtrl.spies[i].name)))),
    );
  }
}
