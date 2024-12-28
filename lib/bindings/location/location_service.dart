import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ultimate_spyfall/constants/storage_keys.dart';
import 'package:ultimate_spyfall/model/location_group.dart';

class LocationService {
  final _box = Get.find<GetStorage>();

  List<LocationGroup> get all {
    if (!_box.hasData(StorageKeys.locationGroups)) {
      return [];
    }
    var jsonLocations = _box.read(StorageKeys.locationGroups) as List<dynamic>;
    return jsonLocations.map((jl) => LocationGroup.fromJson(jl)).toList();
  }

  set all(List<LocationGroup> locationGroups) {
    _box.write(StorageKeys.locationGroups,
        locationGroups.map((l) => l.toJson()).toList());
  }

  LocationGroup get selected =>
      LocationGroup.fromJson(_box.read(StorageKeys.currentLocationGroup));

  set selected(LocationGroup locationGroup) =>
      _box.write(StorageKeys.currentLocationGroup, locationGroup.toJson());
}