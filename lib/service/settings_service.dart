import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';

class SettingsService {
  final _box = Get.find<GetStorage>();

  int get spyCount => _box.read<int>(StorageKeys.spyCount) ?? 1;
  set spyCount(int newValue) => _box.write(StorageKeys.spyCount, newValue);

  bool get prankMode => _box.read<bool>(StorageKeys.prankMode) ?? false;
  set prankMode(bool newValue) => _box.write(StorageKeys.prankMode, newValue);

  bool get coopSpies => _box.read<bool>(StorageKeys.coopSpies) ?? false;
  set coopSpies(bool newValue) => _box.write(StorageKeys.coopSpies, newValue);
}
