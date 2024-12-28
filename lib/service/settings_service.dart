import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';

class SettingsService {
  final _box = Get.find<GetStorage>();

  int get fixedSpyCount => _box.read<int>(StorageKeys.fixedSpyCount) ?? 1;
  set fixedSpyCount(int newValue) => _box.write(StorageKeys.fixedSpyCount, newValue);

  bool get prankMode => _box.read<bool>(StorageKeys.prankMode) ?? false;
  set prankMode(bool newValue) => _box.write(StorageKeys.prankMode, newValue);

  bool get coopSpies => _box.read<bool>(StorageKeys.coopSpies) ?? false;
  set coopSpies(bool newValue) => _box.write(StorageKeys.coopSpies, newValue);

  bool get randomSpies => _box.read<bool>(StorageKeys.randomSpies) ?? false;
  set randomSpies(bool newValue) =>
      _box.write(StorageKeys.randomSpies, newValue);

  int get maxSpyCount => _box.read<int>(StorageKeys.maxSpyCount) ?? 2;
  set maxSpyCount(int newValue) =>
      _box.write(StorageKeys.maxSpyCount, newValue);

  int get minSpyCount => _box.read<int>(StorageKeys.minSpyCount) ?? 1;
  set minSpyCount(int newValue) =>
      _box.write(StorageKeys.minSpyCount, newValue);
}
