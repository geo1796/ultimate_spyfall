import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationsService extends GetxService {
  final _box = Get.find<GetStorage>();

  Future<List<LocationGroup>> getAll() async {
    if (!_box.hasData(StorageKeys.locationGroups)) {
      return [];
    }
    var jsonLocations = _box.read(StorageKeys.locationGroups) as List<dynamic>;
    return jsonLocations.map((jl) => LocationGroup.fromJson(jl)).toList();
  }

  Future<void> setAll(List<LocationGroup> locationGroups) async {
    await _box.write(StorageKeys.locationGroups,
        locationGroups.map((l) => l.toJson()).toList());
  }

  Future<LocationGroup> getCurrent() async {
    return LocationGroup.fromJson(_box.read(StorageKeys.currentLocationGroup));
  }

  Future<void> setCurrent(LocationGroup locationGroup) async {
    await _box.write(StorageKeys.currentLocationGroup, locationGroup.toJson());
  }
}
