import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/bindings/misc/random_int_generator.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';
import 'package:ultimate_spyfall/bindings/location/location_controller.dart';
import 'package:ultimate_spyfall/bindings/player/player_controller.dart';
import 'package:ultimate_spyfall/bindings/settings/settings_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';

class GameController extends GetxController {
  final _randomIntGenerator = Get.find<RandomIntGenerator>();
  final _box = Get.find<GetStorage>();
  final _playerCtrl = Get.find<PlayerController>();
  final _locationCtrl = Get.find<LocationController>();
  final _settingsCtrl = Get.find<SettingsController>();

  final spiesRevealed = false.obs;
  late final List<Player> spies;
  late final String location;
  late final bool isPrank;
  final playerChecks = <Player, RxBool>{};
  final locationChecks = <String, RxBool>{};

  late final String previousLocation;

  String get _previousLocation =>
      _box.read<String>(StorageKeys.previousLocation) ?? '';

  set _previousLocation(String newValue) =>
      _box.write(StorageKeys.previousLocation, newValue);

  @override
  void onInit() {
    super.onInit();

    _initPrankMode();
    _initSpies();
    _initLocations();
  }

  void _initPrankMode() {
    if (_settingsCtrl.prankMode.isFalse) {
      isPrank = false;
      return;
    }

    if (_randomIntGenerator
        .randomInRange(0, 100)
        .isGreaterThan(_settingsCtrl.prankModeChance.value)) {
      isPrank = false;
    } else {
      isPrank = true;
    }
  }

  void _initSpies() {
    final players = [..._playerCtrl.players];

    for (Player p in players) {
      playerChecks[p] = false.obs;
    }

    if (isPrank) {
      spies = players;
      return;
    }

    players.shuffle();

    late final int spyCount;

    if (_settingsCtrl.randomSpies.isTrue) {
      spyCount = _randomIntGenerator.randomInRange(
          _settingsCtrl.minSpyCount.value, _settingsCtrl.maxSpyCount.value);
    } else {
      spyCount = _settingsCtrl.fixedSpyCount.value;
    }

    spies = players.getRange(0, spyCount).toList();
  }

  void _initLocations() {
    previousLocation = _previousLocation;

    final allLocations = [..._locationCtrl.selectedGroup.value.locations];

    for (String location in allLocations) {
      locationChecks[location] = false.obs;
    }

    if (isPrank) {
      location = '';
      return;
    }

    do {
      allLocations.shuffle();
    } while (allLocations[0] == _previousLocation);

    location = allLocations[0];
    _previousLocation = location;
  }

  bool isSpy(Player player) {
    return spies.contains(player);
  }

  List<Player> getDummySpiesForPrankMode(Player player) {
    final players = [..._playerCtrl.players.where((other) => other != player)];
    players.shuffle();

    int spyCount = 0;

    if (_settingsCtrl.randomSpies.isTrue) {
      spyCount += _randomIntGenerator.randomInRange(
          _settingsCtrl.minSpyCount.value, _settingsCtrl.maxSpyCount.value);
    } else {
      spyCount += _settingsCtrl.fixedSpyCount.value;
    }

    return [player, ...players.getRange(0, spyCount < 1 ? 0 : spyCount - 1)];
  }
}
