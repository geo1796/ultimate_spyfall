import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/bindings/random_int_generator.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';
import 'package:ultimate_spyfall/controller/location_controller.dart';
import 'package:ultimate_spyfall/controller/player_controller.dart';
import 'package:ultimate_spyfall/controller/settings_controller.dart';
import 'package:ultimate_spyfall/model/player.dart';

class GameController extends GetxController {
  final _randomIntGenerator = Get.find<RandomIntGenerator>();
  final _box = Get.find<GetStorage>();
  final _playerCtrl = Get.find<PlayerController>();
  final _locationCtrl = Get.find<LocationController>();
  final _settingsCtrl = Get.find<SettingsController>();

  late final List<Player> spies;
  late final String location;

  String get _previousLocation =>
      _box.read<String>(StorageKeys.previousLocation) ?? '';

  set _previousLocation(String newValue) =>
      _box.write(StorageKeys.previousLocation, newValue);

  @override
  void onInit() {
    super.onInit();
    _initSpies();
    _initLocation();
  }

  void _initSpies() {
    final players = [..._playerCtrl.players];
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

  void _initLocation() {
    final allLocations = [..._locationCtrl.selectedGroup.value.locations];

    do {
      allLocations.shuffle();
    } while (allLocations[0] == _previousLocation);

    location = allLocations[0];
    _previousLocation = location;
  }
}
