import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ultimate_spyfall/controller/player_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';

class PlayersPageController {
  final PlayerController _playerController = Get.find();
  final form = GlobalKey<FormState>();
  var data = '';

  List<Player> get currentPlayers => _playerController.players;

  Future<void> addPlayer() async {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    await _playerController.addPlayer(Player(data));
    Get.back();
  }

  Future<void> renamePlayer(Player player) async {
    if (!form.currentState!.validate()) {
      return;
    }
    form.currentState!.save();
    await _playerController.renamePlayer(player.name, Player(data));
    Get.back();
  }
}
