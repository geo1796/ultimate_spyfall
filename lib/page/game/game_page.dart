import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/page/game/bindings/game_controller.dart';
import 'package:ultimate_spyfall/page/game/widget/player_list.dart';
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
        body: const SingleChildScrollView(child: Column(children: [
          PlayerList(),
        ])));
  }
}
