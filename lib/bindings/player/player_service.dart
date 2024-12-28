import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';
import 'package:ultimate_spyfall/model/player.dart';

class PlayerService  {
  final _box = Get.find<GetStorage>();

  Future<List<Player>> getAll() async {
    if (!_box.hasData(StorageKeys.players)) {
      return [];
    }
    var jsonPlayers = _box.read(StorageKeys.players) as List<dynamic>;
    return jsonPlayers.map((jp) => Player.fromJson(jp)).toList();
  }

  Future<void> setAll(List<Player> players) async {
    await _box.write(
        StorageKeys.players, players.map((p) => p.toJson()).toList());
  }
}
