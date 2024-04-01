import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/player.dart';

class PlayerService extends GetxService {
  final _box = GetStorage();

  Future<List<Player>> getAll() async {
    if (!_box.hasData('players')) {
      return [];
    }
    var jsonPlayers = _box.read('players') as List<dynamic>;
    return jsonPlayers.map((jp) => Player.fromJson(jp)).toList();
  }

  Future<void> setAll(List<Player> players) async {
    await _box.write('players', players.map((p) => p.toJson()).toList());
  }

}
