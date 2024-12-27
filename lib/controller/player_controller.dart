import 'package:get/get.dart';
import 'package:ultimate_spyfall/model/player.dart';
import 'package:ultimate_spyfall/service/player_service.dart';

class PlayerController extends GetxController {
  final PlayerService _playerService = Get.find();
  final players = <Player>[].obs;

  @override
  void onInit() async {
    super.onInit();
    var storedPlayers = await _playerService.getAll();
    if (storedPlayers.isEmpty) {
      await _playerService.setAll(defaultPlayers);
      storedPlayers = defaultPlayers;
    }
    players.value = storedPlayers;
  }

  Future<void> removePlayer(Player player) async {
    players.value = players.where((p) => p.name != player.name).toList();
    await _playerService.setAll(players);
  }

  Future<void> addPlayer(Player player) async {
    players.add(player);
    await _playerService.setAll(players);
  }

  Future<void> renamePlayer(String oldName, Player player) async {
    final index = players.indexWhere((p) => p.name == oldName);
    players[index] = player;
    await _playerService.setAll(players);
  }
}
